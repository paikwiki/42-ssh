# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbaek <cbaek@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/25 15:54:09 by cbaek             #+#    #+#              #
#    Updated: 2021/03/30 16:30:54 by cbaek            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# DON'T FORGET!! Run setup.sh with "source"

git config --global user.name cbaek
git config --global user.email cbaek@student.42seoul.kr

alias ll="ls -al"

alias gs="git status"
alias ga="git add"
alias gcm="git commit -m"
alias gd="git diff"
alias gl="git log --oneline"
alias clangw="clang++ -Wall -Wextra -Werror -std=c++98"

alias norm="/usr/bin/norminette"

cd ~
mkdir codes
cd codes

ssh-keygen -t rsa -b 4096 -C "cbaek@student.42seoul.kr"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub

