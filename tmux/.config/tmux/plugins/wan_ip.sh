#!/bin/bash

function wan_ip() {

	tmp_file="./wan_ip.txt"
	wan_up="N/a"

	if [ -z "$wan_ip" ]; then
		wan_ip=$(curl --max-time 2 -s http://whatismyip.akamai.com/)

		if [ "$?" -eq "0" ]; then
			echo "${wan_ip}" > $tmp_file
		elif [ -f "${tmp_file}" ]; then
			wan_ip=$(cat "$tmp_file")
		fi
	fi

	if [ -n "$wan_ip" ]; then
		printf "ⓦ ${wan_ip}"
	fi
}

function main() {
	wan_ip
}

main
