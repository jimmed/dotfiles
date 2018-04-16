# Defined in /home/jim/.local/share/omf/lib/git/git_is_repo.fish @ line 1
function git_is_repo --description 'Check if directory is a repository'
	test -d .git; or command git rev-parse --git-dir >/dev/null ^/dev/null
end
