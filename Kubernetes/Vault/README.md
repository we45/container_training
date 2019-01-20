# Dynamic Secrets with Vault


##### Step 1:

* Navigate to `Vault` directory and deploy the Vault Service

```commandline
cd /root/container_training/Kubernetes/Vault

kubectl create -f vault.yaml

kubectl get deployment

kubectl get svc
```

###### ** Note: `Vault root key` has been set to `vault-root-token`. 


##### Step 2:

* Set IP of Vault Service as an environment variable.

```commandline
VaultIP=http://$(kubectl get svc vault -o yaml | grep "clusterIP" |awk '{print $2}'):8200

echo $VaultIP
```

######  * Note: Vault is available on http://vault:8200 for other kube pods.


##### Step 3:

* Login to `Vault`

```commandline
vault login -address $VaultIP vault-root-token
```


##### Step 4:

* Create a Root CA that expires in a year and generate the root cert.

```commandline
vault secrets enable -address $VaultIP  -path=root-ca -max-lease-ttl=8760h pki

vault write -address $VaultIP root-ca/root/generate/internal common_name="Root CA" ttl=8760h exclude_cn_from_sans=true
```


##### Step 5:

* Setup URLs on Vault

```commandline
vault write -address $VaultIP root-ca/config/urls issuing_certificates="http://vault:8200/v1/root-ca/ca" crl_distribution_points="http://vault:8200/v1/root-ca/crl"
```


##### Step 6:

* Create the Intermediate CA that expires in 180 days

```commandline
vault secrets enable -address $VaultIP -path=intermediate-ca -max-lease-ttl=4320h pki
```


##### Step 7:

* Generate a Certificate Signing Request and ask the Root to sign it

```commandline
vault write -address $VaultIP -format=json intermediate-ca/intermediate/generate/internal common_name="Intermediate CA" ttl=4320h exclude_cn_from_sans=true | jq -r .data.csr > intermediate.csr

vault write -address $VaultIP -format=json root-ca/root/sign-intermediate csr=@intermediate.csr use_csr_values=true exclude_cn_from_sans=true format=pem_bundle | jq -r .data.certificate | sed -e :a -e '/^\n*$/{$d;N;};/\n$/ba' > signed.crt
```


##### Step 8:

* Send the Signed certificate back to Vault and Setup the URLs

```commandline
vault write -address $VaultIP intermediate-ca/intermediate/set-signed certificate=@signed.crt

vault write -address $VaultIP intermediate-ca/config/urls issuing_certificates="http://vault:8200/v1/intermediate-ca/ca" crl_distribution_points="http://vault:8200/v1/intermediate-ca/crl"
```


##### Step 9:

* Enable the AppRole backend on Vault

```commandline
vault auth enable -address $VaultIP approle
```


##### Step 10:

* Create a role to allow Kubernetes-Vault to generate certificates and send the policy to Vault

```commandline
vault write -address $VaultIP intermediate-ca/roles/kubernetes-vault allow_any_name=true max_ttl="24h"

vault policy write -address $VaultIP kubernetes-vault policy-kubernetes-vault.hcl
```


##### Step 11:

* Create a token role for Kubernetes-Vault that generates a 6 hour periodic token and generate token for Kubernetes-Vault and AppID

```commandline
vault write -address $VaultIP auth/token/roles/kubernetes-vault allowed_policies=kubernetes-vault period=6h

CLIENTTOKEN=$(vault token-create -address $VaultIP -format=json -role=kubernetes-vault | jq -r .auth.client_token)

echo $CLIENTTOKEN
```

##### Step 12:

* In `kubernetes-vault.yaml` on `line 54`, replace the value of the token with that of `$CLIENTTOKEN` fetched in the last step and create a deployment.

```commandline
sed -i -e 's/Replace_with_$CLIENTTOKEN_Here/<CLIENTTOKEN>/g' kubernetes-vault.yaml

kubectl create -f kubernetes-vault.yaml
```

EXAMPLE:

```yaml
  kubernetes-vault.yml: |-
    vault:
      addr: http://vault:8200
      token: s.5mEiuuaZoSUyfpZ6WC16mrCX
```

##### Step 13:

* Set up an app-role for sample-app that generates a periodic 6 hour token and add new rules to kubernetes-vault policy

```commandline
vault write -address $VaultIP auth/approle/role/sample-app secret_id_ttl=90s period=6h secret_id_num_uses=1 policies=kubernetes-vault,default

vault policy write -address $VaultIP kubernetes-vault policy-sample-app.hcl
```

* Get the Apps role-id

```commandline
VAULT_ROLE_ID=$(vault read -address $VaultIP -format=json auth/approle/role/sample-app/role-id | jq -r .data.role_id)

echo $VAULT_ROLE_ID
```

##### Step 14:

* In `sample-app.yaml` on `line 27`, replace the value of `VAULT_ROLE_ID` with the value of `$VAULT_ROLE_ID` fetched in the previous step and create the deployment

```commandline
echo $VAULT_ROLE_ID

sed -i -e 's/Replace_with_$VAULT_ROLE_ID_Value_Here/<VAULT_ROLE_ID>/g' sample-app.yaml

kubectl apply -f sample-app.yaml
```

EXAMPLE:

```yaml
  imagePullPolicy: Always
    env:
      - name: VAULT_ROLE_ID
        value: 23c14dda-11d7-054d-bc7a-5e4fc044c946
```

##### Step 15:

* Observe the logs of each `sample-app` pod once it's `Running`. It can be seen that each pod receives a unique token from vault.

```commandline
kubectl get pods

kubectl logs sample-app-xxxxxxxx
```

###### Step 16:

* Stop all the deployments and services created

```commandline
kubectl delete -f vault.yaml -f kubernetes-vault.yaml -f sample-app.yaml
```
