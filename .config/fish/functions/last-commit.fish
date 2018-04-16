# Defined in /home/jim/.config/fish/functions/last-commit.fish @ line 1
function last-commit
	git log -n 1 --no-merges --pretty=format:"%s"
end
