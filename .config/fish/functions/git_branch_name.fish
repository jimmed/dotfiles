# Defined in /home/jim/.local/share/omf/lib/git/git_branch_name.fish @ line 1
function git_branch_name --description 'Get current branch name'
	git_is_repo; and begin
    command git symbolic-ref --short HEAD ^/dev/null;
      or command git show-ref --head -s --abbrev | head -n1 ^/dev/null
  end
end
