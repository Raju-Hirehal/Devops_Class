#!/bin/bash
if [ $# -gt 0 ]
then
    USERS=$@
    for USER in ${USERS[@]}
    do
        echo $USER
    done
else
    echo "Please enter valid input"
fi


#user_automation.sh testuser1 testuser2 testuser3 testuser4 testuser5
