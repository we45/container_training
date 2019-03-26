# **`NodeJsScan - NodeJS Static-Application-Security-Testing`**


Step 1: Navigate to the NodeJsScan directory.

```bash
cd /root/NodeJsScan
```


Step 2: Create a python-virtual environment

```bash
virtualenv -p python2 venv

ls
```


Step 3: Activate python-virtual environment and install the requirements.

```bash
source venv/bin/activate

pip install -r requirements.txt
```


Step 4: Run the scan against a directory containing NodeJS code and generate a `json` report.

```bash
python cli.py -r report -d /root/serverless-training-apps/jwt_example/
```


Step 5: The report is generated and can be read

```bash
cat report.json
```
