function fish_right_prompt
  set -l prompt_color
  switch $USER
    case root toor
      set prompt_color 'red'
    case '*'
      set prompt_color $fish_color_cwd
  end
  echo -n -s (set_color $prompt_color) (prompt_pwd) (set_color normal)
  if is-git-repo
    echo -n -s "  " (set_color blue) (current-branch-name) (set_color normal)
  end
end
