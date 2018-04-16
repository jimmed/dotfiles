# Defined in /home/jim/.config/fish/functions/squash.fish @ line 1
function squash --argument count
	git rebase -i HEAD~$count
end
