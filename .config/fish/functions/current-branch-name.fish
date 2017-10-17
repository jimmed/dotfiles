function current-branch-name
  git rev-parse --abbrev-ref HEAD ^ /dev/null
end
