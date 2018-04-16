# Defined in /home/jim/.local/share/omf/lib/git/git_is_staged.fish @ line 1
function git_is_staged --description 'Check if repo has staged changes'
	git_is_repo; and begin
    not command git diff --cached --no-ext-diff --quiet --exit-code
  end
end
