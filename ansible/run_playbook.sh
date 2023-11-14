#!/bin/bash

error_msg="You must provide tag argument 'personal' or 'work'"
if [ $# -eq 0 ]; then
    echo $error_msg;
    exit 1;
fi

tags_to_skip=""
if [ "$1" = "personal" ]; then
    tags_to_skip="work"
elif [ "$1" = "work" ] ; then
    tags_to_skip="personal"
else
    echo $error_msg;
    exit 1;
fi

echo "ansible-playbook local.yml --skip-tags $tags_to_skip"
ansible-playbook local.yml --skip-tags $tags_to_skip --ask-become-pass
