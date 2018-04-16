# Defined in /home/jim/.local/share/omf/lib/git/git_is_dirty.fish @ line 1
function git_is_dirty --description 'Check if there are changes to tracked files'
	git_is_repo; and not command git diff --no-ext-diff --quiet --exit-code
end
