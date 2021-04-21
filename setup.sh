#!/bin/sh

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbaek <cbaek@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/25 15:54:09 by cbaek             #+#    #+#              #
#    Updated: 2021/04/21 10:13:43 by cbaek            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -- variables --------------------------------------------------------------- #
printf "=======================================\n"
printf "=                                     =\n"
printf "=  Setup-42SSH                        =\n"
printf "=                                     =\n"
printf "=======================================\n"
printf "\n"
source ./source/config.sh

# -- git user ---------------------------------------------------------------- #
printf "\e[33mname: $USER_42 \e[0m\n"
printf "\e[33memail: $MAIL_42 \e[0m\n"
printf "\e[32m[01/03] Set git user name & email --global?(y/N) \e[0m"
read yn
case $yn in
	[Yy]* ) git config --global user.name $USER_42
			git config --global user.email $MAIL_42
			break;;
	[Nn]* ) break;;
	* ) echo "Unexpected input. skip." break;;
esac

# -- ssh keygen -------------------------------------------------------------- #
printf "\e[33mkey name: $SSH_KEYNAME \e[0m\n"
printf "\e[32m[02/03] Create ssh key-pair?(y/N) \e[0m"
read yn
case $yn in
	[Yy]* ) ssh-keygen -t rsa -b 4096 -C $SSH_KEYNAME;
			eval "$(ssh-agent -s)";
			ssh-add ~/.ssh/$SSH_KEYNAME;
			break;;
	[Nn]* ) break;;
	* ) echo "Unexpected input. skip."; break;;
esac

# -- put pub key ------------------------------------------------------------- #
printf "\e[32m[03/03] Put pub ssh-key?(y/N) \e[0m";
read yn
case $yn in
	[Yy]* ) cat ~/.ssh/$SSH_KEYNAME.pub; break;;
	[Nn]* ) break;;
	* ) echo "Unexpected input. skip."; break;;
esac
