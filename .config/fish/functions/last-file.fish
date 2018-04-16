# Defined in /home/jim/.config/fish/functions/last-file.fish @ line 1
function last-file
	ls -rt | tail -n 1
end
