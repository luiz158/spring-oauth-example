#!/usr/bin/env bash

# grep --color=never -Po '"access_token":.*?[^\\]",'

# Acquire token from the OAuth server with our client credentials
TOKEN=$(curl -X POST --silent --noproxy localhost -u curl-client:client-secret 'localhost:8081/oauth/token?grant_type=client_credentials' -H "Accept: application/json" | egrep --color=never -o '[a-f0-9-]{20,}')
echo "Got token $TOKEN"
curl --noproxy localhost localhost:8080/todos -H "Authorization: Bearer $TOKEN"

echo ''
