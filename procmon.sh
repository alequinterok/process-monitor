#!/bin/bash
old=$(ps -eo command)

while true; do
	new=$(ps -eo command)
	diff <(echo "$old") <(echo "$new") | grep [\<\>] | grep -vE "procmon|command|kworker"
	old=$new
done
