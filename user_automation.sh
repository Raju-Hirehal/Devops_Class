#!/bin/bash
if [ $# -gt 0 ]
then
    USERS=$@
    for USER in ${USERS[@]}
    do
    EXISTING_USER=$(cat /etc/passwd | grep -i $USER | cut -d ":" -f1)
    if [ "${EXISTING_USER}" = "${USER} ]
    then
    echo "User name $USER already exists tra a different name"
    else
    echo "lets create $USER"
    fi
    done
else
    echo "Please enter valid input"
fi
