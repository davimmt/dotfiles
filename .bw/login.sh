#!/bin/bash

set -euo pipefail

email=$1
auth_code=$2
login_code=0
login=$(bw login $email "$(cat $BW_MASTERPASSWORD_FILE)" --method 0 --code $auth_code) || login_code="$?"
# if error is that youve already logged in, ignore and continue the script
[[ $login_code && $(echo "$login" | grep -Fq 'You are already logged in as ') -eq 0 ]] || true
# save session token to file
bw unlock --passwordfile $BW_MASTERPASSWORD_FILE | grep -o '^$ export BW_SESSION=".*"$' | sed -r 's/.*"(.*)"/\1/' > $BW_SESSION_FILE
# just in case
chmod 0600 $BW_MASTERPASSWORD_FILE
chmod 0600 $BW_SESSION_FILE
bw sync
exit 0
