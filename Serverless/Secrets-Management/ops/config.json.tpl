{
  "version": "2.0",
  "app_name": "training-secrets",
  "stages": {
    "dev": {
      "api_gateway_stage": "api",
      "manage_iam_role": false,
      "iam_role_arn": "${ROLE_NAME}",
      "environment_variables": {
        "DB_TABLE": "${DB_TABLE}",
        "KEY_ID": "${KEY_ID}"
      }
    }
  }
}
