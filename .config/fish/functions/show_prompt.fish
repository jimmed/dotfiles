# Defined in /tmp/fish.i8iEPK/show_prompt.fish @ line 2
function show_prompt --description 'Shows prompt with cue for current priv'
	set -l uid (id -u $USER)
  if [ $uid -eq 0 ]
    prompt_segment normal yellow "ROOT❱ "
    set_color normal
    echo -n -s " "
  else
    if [ $RETVAL -eq "0" ]
      prompt_segment normal white "❱ "
    else
      prompt_segment normal red "❱ "
    end
  end

  set_color normal
end
