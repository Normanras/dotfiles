run_program() {
	default_route_nic=$(route get default | grep -i interface | awk '{print $2}')
	all_nics=$(ifconfig 2>/dev/null | awk -F':' '/^[a-z]/ && !/^lo/ { print $1 }' | tr '\n' ' ')
	IFS=' ' read -ra all_nics_array <<< "$all_nics"
	all_nics_array=("$default_route_nic" "${all_nics_array[@]}")
	for nic in "${all_nics_array[@]}"; do
	 	ipv4s_on_nic=$(ifconfig ${nic} 2>/dev/null | awk '$1 == "inet" { print $2 }')
		echo ${ipv4s_on_nic}
		for lan_ip in ${ipv4s_on_nic[@]}; do
			echo ${lan_ip}
	 		[[ -n "${lan_ip}" ]]
		done
		[[ -n "${lan_ip}" ]]
	 done
	echo "ⓛ ${lan_ip-Not working}"
	return 0
}

"$@"
