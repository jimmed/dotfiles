function squash --argument count
  git rebase -i HEAD~$count
end
