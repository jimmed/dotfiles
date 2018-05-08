# Defined in /tmp/fish.bv9wXY/fish_right_prompt.fish @ line 2
function fish_right_prompt --description 'Prints right prompt'
	show_pwd
	show_virtualenv
	get_git_status
	set_color normal
end
