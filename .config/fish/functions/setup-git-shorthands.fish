function setup-git-shorthands
  set commands {pull,push,commit,checkout,branch,rebase,whatchanged,merge,fetch,status}
  for cmd in $commands
    set -l shorthand
    switch $cmd
      case 'status'
        set shorthand 'g'(echo $cmd | head -c1)
      case '*'
        set shorthand 'g'(echo $cmd | sed 's/[aeiou]//g' | head -c2)
    end
    alias $shorthand="git $cmd"
  end
end
