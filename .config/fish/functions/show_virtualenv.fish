# Defined in /tmp/fish.lHk3n1/show_virtualenv.fish @ line 2
function show_virtualenv --description 'Show active nvm environment'
	set -l nvm_current (nvm current)
    if [ nvm_current ]
      prompt_segment cyan white " $nvm_current "
    end
    set_color normal
end
