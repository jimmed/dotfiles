# Defined in /home/jim/.config/fish/functions/show_pwd.fish @ line 2
function show_pwd --description 'Show the current directory'
	set -l pwd (prompt_pwd)
  prompt_segment normal blue "$pad$pwd "
end
