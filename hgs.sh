#! /usr/bin/bash

# checks what version control system and passes arguments through
# example: $ ghs status

if [ -e .git ]; then
   git $@
elif [ -e .svn ]; then
   svn $@
else
   hg $@
fi

