#!/bin/sh

# from https://coderwall.com/p/mnwcog/create-new-github-repo-from-command-line
# creates github repo with name in first argument
# meant to be called from root directory of repo

repo_name=$1
test -z $repo_name && echo "Repo name required." 1>&2 && exit 1

curl -u 'longlouisly:86852669c153f23b76d73164834682f89f7dba3e' https://api.github.com/user/repos -d "{\"name\":\"$repo_name\",\"private\": true}"


# sets up path in local repo
git init
#git remote add origin "https://github.com/your_github_username/$repo_name.git"  
git remote add origin "git@github.com:longlouisly/$repo_name.git"  # for ssh
