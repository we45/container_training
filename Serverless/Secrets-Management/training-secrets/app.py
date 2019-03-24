from chalice import Chalice
import boto3
from os import environ
from uuid import uuid4
from os import urandom
import base64

ssm = boto3.client('ssm', region_name='us-west-2')
client = boto3.client('kms')
dynamo = boto3.resource('dynamodb')

db = environ.get('DB_TABLE')
kms_cmk = environ.get('KEY_ID')
jwt_pwd = ssm.get_parameter(Name = 'we45-training-jwt-pass', WithDecryption = True)['Parameter']['Value']

pad = lambda s: s + (32 - len(s) % 32) * b' '
app = Chalice(app_name='training-secrets')


def gen_key_seed():
    data_key = client.generate_data_key(
        KeyId=kms_cmk,
        KeySpec="AES_256",
    )
    ciphertext_blob = base64.b64encode(data_key.get('CiphertextBlob')).decode()
    plaintext_key = data_key.get('Plaintext')
    print("Plaintext key: {}".format(plaintext_key))
    return ciphertext_blob


@app.route('/create-user',methods = ['POST'], content_types=['application/json'], cors = True)
def create_user():
    jbody = app.current_request.json_body
    if isinstance(jbody, dict):
        if 'email' in jbody:
            table = dynamo.Table(db)
            key = gen_key_seed()
            table.put_item(
                Item={
                    'email': jbody['email'],
                    'key': key
                }
            )
            return {"success": "created user: {}".format(jbody['email'])}
