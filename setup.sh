#!/bin/sh

git config --global user.name cbaek
git config --global user.email cbaek@student.42seoul.kr

alias ll="ls -al"

alias gs="git status"
alias ga="git add"
alias gcm="git commit -m"
alias gl="git log --oneline"

alias norm="/usr/bin/norminette"

cd ~
mkdir codes
cd codes

ssh-keygen -t rsa -b 4096 -C "cbaek@student.42seoul.kr"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
