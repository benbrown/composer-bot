az account get-access-token | jq > access.json
jq '.subscription' access.json
jq '.accessToken' access.json
