# Defined in /tmp/fish.lEAfD5/show_prompt.fish @ line 2
function show_prompt --description 'Shows prompt with cue for current priv'
	set -l uid (id -u $USER)
    if [ $uid -eq 0 ]
    prompt_segment red white " ! "
    set_color normal
    echo -n -s " "
  else
    prompt_segment normal white "❱ "
    end

  set_color normal
end
