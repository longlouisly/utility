
# some script to auto migrate from bitbucket to github, then rename the bitbucket repo

set -e
REPO_NAME=$1
GIT_REPO=git_bare_$REPO_NAME

echo "Creating bare repo"
git init --bare $GIT_REPO

echo "Cloning the hg repository"
hg clone ssh://hg@bitbucket.org/longlouisly/$REPO_NAME 

cd $REPO_NAME

# create a branch called hg (not necessary, creates it in master by default)
#hg bookmarks hg

echo "Pushing the hg repository to the local git repository"
hg push ../$GIT_REPO


cd ../$GIT_REPO
# push to a remote git repository
echo "Creating github repo"
create_github_repo $REPO_NAME
git remote add origin git@github.com:longlouisly/$REPO_NAME.git

echo "Pushing to github"
git push --all origin


echo "Renaming bitbucket with migrated prefix"
curl -X PUT --user longlouisly:x8bq7aEsfkWkVTn6MwR7 https://bitbucket.org/api/2.0/repositories/longlouisly/$REPO_NAME  --data "name=migrated_$REPO_NAME"

echo DONE

