# **`Safety - Python Source-Code-Analysis-Tool`**


Step 1: Navigate to the directory(`~/serverless-training-apps`) that has the python virtual-environment.

```bash
cd ~/serverless-training-apps
```


Step 2: Create and activate python-virtual environment by running `source venv/bin/activate`

```bash
virtualenv venv

source venv/bin/activate
```


Step 3: Install the necessary requirements

```bash
pip install -r ~/serverless-training-apps/cv_uploader/cv-upload-handler/requirements.txt
```


Step 4: Run a scan on installed python libraries by running `safety check --json`

![](img/safety-4.png)

