# Defined in /home/jim/.config/fish/functions/gpsu.fish @ line 2
function gpsu
	gps -u origin (current-branch-name)
end
