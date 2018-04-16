# Defined in /tmp/fish.qNDxji/fish_right_prompt.fish @ line 2
function fish_right_prompt --description 'Prints right prompt'
	get_git_status
	show_pwd
end
