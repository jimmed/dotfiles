function gcmf --argument message
	gcm -m "["(current-branch-name)"] $message"
end
