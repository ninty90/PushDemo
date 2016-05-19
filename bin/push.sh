#!/bin/sh

# openssl >= 1.0.2e should be installed
# curl 7.46+ with http/2 support

# Put your device token here (without spaces):
device_token="997a5397a69c4cb82da3e11404aba955e34ec0d06e9dbf2ba50fd86309fdbca4"

# Put your private key's passphrase here:
passphrase=""

# Put your app bundle id here:
bundle_id="tw.com.chainsea.PushDemo"

message=$1

curl -d "{\"aps\":{\"alert\":\"${message}\",\"sound\":\"default\"}}" \
    --cert "PushDemo.pem":"PushDemo" \
    -H "apns-topic: ${bundle_id}" \
    --http2 \
    https://api.development.push.apple.com/3/device/${device_token}
