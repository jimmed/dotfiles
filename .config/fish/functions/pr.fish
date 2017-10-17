function pr --argument base_branch
	xdg-open (git pull-request -m (last-commit) -b $base_branch)
end
