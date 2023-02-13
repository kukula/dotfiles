#!/bin/zsh

test:
	clear
	nvim --headless -c "lua R = require('tests/init'); R.run_all()" & pid=$!
	waiting = 2
	sleep $waiting
	still_running = ps | grep $pid | grep nvim | wc -l
	if [ still_running -gt 0]; then
		echo Killing after $waiting seconds
		kill -INT $pid
	fi




