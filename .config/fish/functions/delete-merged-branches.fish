# Defined in /home/jim/.config/fish/functions/delete-merged-branches.fish @ line 1
function delete-merged-branches
	git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d
  and git branch
end
