# Defined in /tmp/fish.B5L7cl/gpsu.fish @ line 2
function gpsu
	gps -u origin (current-branch-name) $argv
end
