# Defined in /home/jim/.config/fish/functions/get-my-ip.fish @ line 2
function get-my-ip
	curl -s checkip.amazonaws.com | xclip -sel clipboard
end
