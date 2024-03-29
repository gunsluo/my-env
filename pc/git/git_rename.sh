#!/bin/sh


git filter-branch --env-filter '
 
an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"
 
if [ "$GIT_COMMITTER_EMAIL" = "rongzhihong@gome.com.cn" ]
then
    cn="hzrong007"
    cm="hzrong007@163.com"
fi
if [ "$GIT_AUTHOR_EMAIL" = "rongzhihong@gome.com.cn" ]
then
    an="hzrong007"
    am="hzrong007@163.com"
fi
 
echo "$an"
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"
'

git filter-branch -f \
--index-filter 'git rm --cached --ignore-unmatch Rakefile' HEAD
