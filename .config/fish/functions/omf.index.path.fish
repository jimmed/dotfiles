# Defined in /home/jim/.local/share/omf/pkg/omf/functions/index/omf.index.path.fish @ line 1
function omf.index.path --description 'Get the path to the local package index'
	set -q XDG_CACHE_HOME
    and echo "$XDG_CACHE_HOME/omf"
    or echo "$HOME/.cache/omf"
end
