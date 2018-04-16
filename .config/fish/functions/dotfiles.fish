# Defined in - @ line 0
function dotfiles --description 'alias dotfiles=/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv;
end
