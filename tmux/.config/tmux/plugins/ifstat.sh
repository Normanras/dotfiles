#!/bin/bash

find_data=$(ifstat -S -q 1 1)
interfaces=$(echo -e "${find_data}" | head -n 1)
final=()
for interface in ${interfaces}; do
	has_data=$(ifstat -i ${interface} -S -q 1 1 | tail -n 1 | tr -d '\r' | tr -d ' ')
	if [[ "$has_data" != "0.000.00" ]]; then
		for int in ${interface}; do
			data=$(ifstat -i ${interface} -S -q 1 1)
			flow_data=$(echo -e "${data}" | tail -n 1 | tr -d '\r' )
			up=${flow_data% *}
			down=${flow_data##* }
			up=$up | tr -d ' '
			down=$down | tr -d ' '
			final+=("$int: $up/ $down")
			echo $final
		done
		# OUTPUT="⇈ $up ⇊ $down"
		# echo $OUTPUT
	fi
done


# data=$(ifstat -i en0 -i en5 -S -q 1 1)
# flow_data=$(echo -e "${data}" | tail -n 1 | tr -d '\r')
# up=${flow_data% *}
# down=${flow_data##* }
# OUTPUT="⇈ $up ⇊ $down"
# echo $OUTPUT
