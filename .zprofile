export PATH=~/.local/bin:~/.cargo/bin:$PATH

if [[ -z $DISPLAY && $TTY = /dev/tty1 ]]; then
	 exec sway
fi
