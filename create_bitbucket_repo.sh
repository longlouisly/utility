#!/bin/bash
# Takes arg as name of new repo to be created in bitbucket
# Changes default path to newly created repo for pushing
# Use in root directory of local hg repo

test -z $1 && echo "Repo name required." 1>&2 && exit 1

curl -X POST -v -u longlouisly -H "Content-Type: application/json" \
  https://api.bitbucket.org/2.0/repositories/longlouisly/$1 \
  -d '{"scm": "hg", "is_private": "true", "fork_policy": "no_forks" }'

hg init
echo [paths] >> .hg/hgrc
echo "default = ssh://hg@bitbucket.org/longlouisly/$1" >> .hg/hgrc

     
