#/bin/bash

# This script launch difftool for the given filename and for the last commit
if [ -z "$1" ]
  then
    echo "diff_one_file.sh filename"
fi

last_commit=`git log -2 --format=oneline $1 | tail -n 1 | cut -d ' ' -s -f 1`
git difftool -y ${last_commit} $1
