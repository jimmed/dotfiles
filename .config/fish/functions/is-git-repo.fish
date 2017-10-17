function is-git-repo
  git rev-parse --git-dir > /dev/null ^ /dev/null
end
