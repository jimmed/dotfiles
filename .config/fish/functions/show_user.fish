# Defined in /home/jim/.config/fish/functions/show_user.fish @ line 2
function show_user --description 'Show user'
	if not contains $USER $default_user; or test -n "$SSH_CLIENT"
    set -l host (hostname -s)
    set -l who (whoami)
    prompt_segment normal yellow " $who"

    # Skip @ bit if hostname == username
    if [ "$USER" != "$HOST" ]
      prompt_segment normal white "@"
      prompt_segment normal green "$host "
      set pad ""
    end
  end
end
