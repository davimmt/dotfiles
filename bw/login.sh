#!/bin/bash

set -euo pipefail

# save your api key credentials to these files
export BW_CLIENTID=$(cat $BW_CLIENTID_FILE)
export BW_CLIENTSECRET=$(cat $BW_CLIENTSECRET_FILE)
login_code=0
login=$(bw login --apikey) || login_code="$?"
# just in case
unset BW_CLIENTID BW_CLIENTSECRET
# if error is that youve already logged in, ignore and continue the script
[[ $login_code && $(echo "$login" | grep -Fq 'You are already logged in as ') -eq 0 ]] || true
# save session token to file
bw unlock --passwordfile $BW_MASTERPASSWORD_FILE | grep -o '^$ export BW_SESSION=".*"$' | sed -r 's/.*"(.*)"/\1/' > $BW_SESSION_FILE
# just in case
chmod 0600 $BW_CLIENTID_FILE $BW_CLIENTSECRET_FILE $BW_MASTERPASSWORD_FILE
bw sync
exit 0
