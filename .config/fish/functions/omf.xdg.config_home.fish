# Defined in /home/jim/.local/share/omf/pkg/omf/functions/core/omf.xdg.config_home.fish @ line 1
function omf.xdg.config_home --description 'Return the config directory based on XDG specs'
	set -q XDG_CONFIG_HOME;
    and echo "$XDG_CONFIG_HOME";
    or echo "$HOME/.config"
end
