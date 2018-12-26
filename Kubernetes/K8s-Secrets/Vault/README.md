## Dynamic Secrets with Vault


##### Step 1:

* Deploy the Vault Service

```commandline
kubectl create -f vault.yaml
kubectl get deployment
kubectl get svc
```

###### ** Note: `Vault root key` has been set to `vault-root-token`. 


##### Step 2:

* Setup `port-forwarding` to vault running on the cluster.

```commandline
vaultPod=$(kubectl get pod | grep "^vault*" |awk '{print $1}')
nohup kubectl port-forward "$vaultPod" 8200 &
```

* Confirm that port-forwarding has been enabled by accessing `http://127.0.0.1:8200/ui` on the browser

######  * Note: Vault is available on http://vault:8200 for other kube pods.


##### Step 3:

* Login to `Vault`

```commandline
vault login vault-root-token
```


##### Step 4:

* Create a Root CA that expires in a year and generate the root cert.

```commandline
vault secrets enable -path=root-ca -max-lease-ttl=8760h pki
vault write root-ca/root/generate/internal common_name="Root CA" ttl=8760h exclude_cn_from_sans=true
```


##### Step 5:

* Setup URLs on Vault

```commandline
vault write root-ca/config/urls issuing_certificates="http://vault:8200/v1/root-ca/ca" crl_distribution_points="http://vault:8200/v1/root-ca/crl"
```


##### Step 6:

* Create the Intermediate CA that expires in 180 days

```commandline
vault secrets enable -path=intermediate-ca -max-lease-ttl=4320h pki
```


##### Step 7:

* Generate a Certificate Signing Request and ask the Root to sign it

```commandline
vault write -format=json intermediate-ca/intermediate/generate/internal common_name="Intermediate CA" ttl=4320h exclude_cn_from_sans=true | jq -r .data.csr > intermediate.csr
vault write -format=json root-ca/root/sign-intermediate csr=@intermediate.csr use_csr_values=true exclude_cn_from_sans=true format=pem_bundle | jq -r .data.certificate | sed -e :a -e '/^\n*$/{$d;N;};/\n$/ba' > signed.crt
```


##### Step 8:

* Send the Signed certificate back to Vault and Setup the URLs

```commandline
vault write intermediate-ca/intermediate/set-signed certificate=@signed.crt
vault write intermediate-ca/config/urls issuing_certificates="http://vault:8200/v1/intermediate-ca/ca" crl_distribution_points="http://vault:8200/v1/intermediate-ca/crl"
```


##### Step 9:

* Enable the AppRole backend on Vault

```commandline
vault auth enable approle
```


##### Step 10:

* Create a role to allow Kubernetes-Vault to generate certificates and send the policy to Vault

```commandline
vault write intermediate-ca/roles/kubernetes-vault allow_any_name=true max_ttl="24h"
vault policy write kubernetes-vault policy-kubernetes-vault.hcl
```


##### Step 11:

* Create a token role for Kubernetes-Vault that generates a 6 hour periodic token and generate token for Kubernetes-Vault and AppID

```commandline
vault write auth/token/roles/kubernetes-vault allowed_policies=kubernetes-vault period=6h
CLIENTTOKEN=$(vault token-create -format=json -role=kubernetes-vault | jq -r .auth.client_token)
```

##### Step 12:

* In `kubernetes-vault.yaml` replace the value of the token with CLIENTTOKEN and create a deployment

```commandline
echo $CLIENTTOKEN
kubectl create -f kubernetes-vault.yaml
```


##### Step 13:

* Set up an app-role for sample-app that generates a periodic 6 hour token and add new rules to kubernetes-vault policy

```commandline
vault write auth/approle/role/sample-app secret_id_ttl=90s period=6h secret_id_num_uses=1 policies=kubernetes-vault,default
vault policy write kubernetes-vault policy-sample-app.hcl
```

* Get the Apps role-id

```commandline
VAULT_ROLE_ID=$(vault read -format=json auth/approle/role/sample-app/role-id | jq -r .data.role_id)
```

##### Step 14:

* Replace the value of `VAULT_ROLE_ID` in `sample-app.yaml` and create the deployment

```commandline
echo $VAULT_ROLE_ID
kubectl apply -f sample-app.yaml
```

##### Step 15:

* Observe the logs of each `sample-app` pod running. It can be seen that each pod receives a unique token from vault

```commandline
kubectl get pods
kubectl logs sample-app-xxxxxxxx
```

###### Step 16:

* Stop all the deployments and services created

```commandline
kubectl delete -f vault.yaml -f kubernetes-vault.yaml -f sample-app.yaml
```

* Kill the `port-forwarding` process

```commandline
pid=$(pgrep -f "kubectl port-forward" | grep 8200)
kill $pid
```
