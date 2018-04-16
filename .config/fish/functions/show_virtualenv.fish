# Defined in /home/jim/.config/fish/functions/show_virtualenv.fish @ line 2
function show_virtualenv --description 'Show active python virtual environments'
	if set -q VIRTUAL_ENV
    set -l venvname (basename "$VIRTUAL_ENV")
    prompt_segment normal white " ($venvname) "
  end
end
