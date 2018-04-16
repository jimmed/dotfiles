# Defined in /home/jim/.config/fish/functions/is-git-repo.fish @ line 1
function is-git-repo
	git rev-parse --git-dir > /dev/null ^ /dev/null
end
