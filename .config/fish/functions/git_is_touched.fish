# Defined in /home/jim/.local/share/omf/lib/git/git_is_touched.fish @ line 1
function git_is_touched --description 'Check if repo has any changes'
	git_is_repo; and begin
    test -n (echo (command git status --porcelain))
  end
end
