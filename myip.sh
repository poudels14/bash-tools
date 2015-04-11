#!/bin/bash

myip() {
	local x=$(ifconfig | awk '/en1/{getline;getline;print}')
	IFS=" " read -a array <<< "$x"
	#PWD_URL="${array[1]}"
	#printf '\e]7;%s\a' "$PWD_URL"
	echo "${array[1]}"
}

