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
id42="cbaek"
email42="cbaek@student.42seoul.kr"

# -- git user ---------------------------------------------------------------- #
read -p "Set git user name & email --global?(y/N)" yn
case $yn in
	[Yy]* ) git config --global user.name $id42
			git config --global user.email $email42
			break;;
	[Nn]* ) break;;
	* ) echo "Unexpected input. skip."; break;;
esac

# -- aliases ----------------------------------------------------------------- #
read -p "Apply alias set(./sh_aliases)?(y/N)" yn
case $yn in
	[Yy]* ) source ./sh_aliases.sh; break;;
	[Nn]* ) break;;
	* ) echo "Unexpected input. skip."; break;;
esac

# -- ssh keygen -------------------------------------------------------------- #
read -p "Create ssh key-pair?(y/N)" yn
case $yn in
	[Yy]* ) ssh-keygen -t rsa -b 4096 -C "cbaek@student.42seoul.kr"; \
			eval "$(ssh-agent -s)"; \
			ssh-add ~/.ssh/id_rsa; \
			break;;
	[Nn]* ) break;;
	* ) echo "Unexpected input. skip."; break;;
esac

# -- put pub key ------------------------------------------------------------- #
read -p "Put pub ssh-key?(y/N)" yn
case $yn in
	[Yy]* ) cat ~/.ssh/id_rsa.pub; break;;
	[Nn]* ) break;;
	* ) echo "Unexpected input. skip."; break;;
esac
