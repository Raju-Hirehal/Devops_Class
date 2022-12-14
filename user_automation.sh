#!/bin/bash
if [ $# -gt 0 ]; then
    USERS=$@
    for USER in ${USERS[@]}; do
        EXISTING_USER=$(cat /etc/passwd | grep -i ubuntu | cut -d ":" -f1)
        if [ "${EXISTING_USER}" = "${USER}" ]; then
            echo "USERNAME $USER ALREADY EXISTS TRY A DIFFERENT NAME"
        else
            echo "Lets crate user $USER"
            sudo useradd -m $USER --shell /bin/bash
            SPEC='!@#$%^&*()_'
            SPEC_CHAR=$(echo $SPEC | fold -w1 | shuf | head -1)
            PASSWORD=India@${RANDOM}${SPEC_CHAR}
            echo "$USER:$PASSWORD" | sudo chpasswd
            passwd -e $USER
            echo $PASSWORD
        fi
    done
else
    echo "Please enter valid input"
fi

#user_automation.sh testuser1 testuser2 testuser3 testuser4 testuser5
