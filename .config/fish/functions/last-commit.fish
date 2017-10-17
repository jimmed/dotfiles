function last-commit
  git log -n 1 --no-merges --pretty=format:"%s"
end
