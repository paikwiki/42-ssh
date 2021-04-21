#!/bin/sh

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbaek <cbaek@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/25 15:54:09 by cbaek             #+#    #+#              #
#    Updated: 2021/04/21 08:25:07 by cbaek            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -- variables --------------------------------------------------------------- #
source ./source/config.sh

# -- git user ---------------------------------------------------------------- #
printf "\e[32m[01/04] Set git user name & email --global?(y/N) \e[0m";
read yn
case $yn in
	[Yy]* ) git config --global user.name $id42
			git config --global user.email $email42
			break;;
	[Nn]* ) break;;
	* ) echo "Unexpected input. skip."; break;;
esac

# -- aliases ----------------------------------------------------------------- #
printf "\e[32m[02/04] Apply alias set(./sh_aliases)?(y/N) \e[0m";
read yn
case $yn in
	[Yy]* ) source ./source/sh_aliases.sh; break;;
	[Nn]* ) break;;
	* ) echo "Unexpected input. skip."; break;;
esac

# -- ssh keygen -------------------------------------------------------------- #
printf "\e[32m[03/04] Create ssh key-pair?(y/N) \e[0m";
read yn
case $yn in
	[Yy]* ) ssh-keygen -t rsa -b 4096 -C $email42; \
			eval "$(ssh-agent -s)"; \
			ssh-add ~/.ssh/id_rsa; \
			break;;
	[Nn]* ) break;;
	* ) echo "Unexpected input. skip."; break;;
esac

# -- put pub key ------------------------------------------------------------- #
printf "\e[32m[04/04] Put pub ssh-key?(y/N) \e[0m";
read yn
case $yn in
	[Yy]* ) cat ~/.ssh/id_rsa.pub; break;;
	[Nn]* ) break;;
	* ) echo "Unexpected input. skip."; break;;
esac
