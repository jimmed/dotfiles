# Defined in /home/jim/.local/share/omf/lib/git/git_is_stashed.fish @ line 1
function git_is_stashed --description 'Check if repo has stashed contents'
	git_is_repo; and begin
    command git rev-parse --verify --quiet refs/stash >/dev/null
  end
end
