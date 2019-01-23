## SQL Injection - Event Injection

This is a slightly unconventional SQL Injection attack, in that, its triggered on an INSERT statement.

The SQLi can be triggered by tampering with the "reading" from the "sensor", you can trigger a SQL Injection attack on the INSERT Statement.

You can leverage mysql functions, global variables, etc for the attack

* Run `cd /root/DVFaaS-Damn-Vulnerable-Functions-as-a-Service/`
* Run `pipenv shell`
* Run `cd /root/DVFaaS-Damn-Vulnerable-Functions-as-a-Service/injection/mqtt_rds_sql_event_injection`
* Run `python payload_generator.py <your_name> 358174707935`

These will send SNS messages with the SQL Injection payloads, which our vulnerable function will read, process and insert into the Database. Wait for instructor to show you how it works