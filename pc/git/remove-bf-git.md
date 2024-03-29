
```
./remove-bf-git.sh

git filter-branch --force --index-filter 'git rm -rf --cached --ignore-unmatch 你的大文件名' --prune-empty --tag-name-filter cat -- --all

rm -rf .git/refs/original/
git reflog expire --expire=now --all
git gc --prune=now
git gc --aggressive --prune=now

git count-objects -vH


git push origin main --force
```
