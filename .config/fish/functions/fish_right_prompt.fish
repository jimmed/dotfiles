# Defined in /tmp/fish.KTPm8v/fish_right_prompt.fish @ line 2
function fish_right_prompt --description 'Prints right prompt'
	show_pwd
	#show_virtualenv
	get_git_status
	set_color normal
end
