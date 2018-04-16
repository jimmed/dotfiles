# Defined in /home/jim/.local/share/omf/lib/git/git_untracked.fish @ line 1
function git_untracked --description 'Print list of untracked files'
	git_is_repo; and begin
    command git ls-files --other --exclude-standard
  end
end
