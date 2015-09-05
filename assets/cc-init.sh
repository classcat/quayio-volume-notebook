#!/bin/bash

########################################################################
# ClassCat/Volume-Notebook Asset files
# Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved.
########################################################################

#--- HISTORY -----------------------------------------------------------
# 05-sep-15 : fixed.
#-----------------------------------------------------------------------


######################
### INITIALIZATION ###
######################

function init () {
  echo "ClassCat Info >> initialization code for ClassCat/Volume-Notebook"
  echo "Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved."
  echo ""
}


############
### SSHD ###
############

function change_root_password() {
  if [ -z "${ROOT_PASSWORD}" ]; then
    echo "ClassCat Warning >> No ROOT_PASSWORD specified."
  else
    echo -e "root:${ROOT_PASSWORD}" | chpasswd
    # echo -e "${password}\n${password}" | passwd root
  fi
}


function put_public_key() {
  if [ -z "$SSH_PUBLIC_KEY" ]; then
    echo "ClassCat Warning >> No SSH_PUBLIC_KEY specified."
  else
    mkdir -p /root/.ssh
    chmod 0700 /root/.ssh
    echo "${SSH_PUBLIC_KEY}" > /root/.ssh/authorized_keys
  fi
}


### ENTRY POINT ###

init 
change_root_password
put_public_key

exit 0


### End of Script ###

