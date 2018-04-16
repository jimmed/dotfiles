# Defined in /home/jim/.config/fish/functions/gcmf.fish @ line 1
function gcmf --argument message
	gcm -m "["(current-branch-name)"] $message"
end
