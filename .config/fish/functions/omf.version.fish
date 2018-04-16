# Defined in /home/jim/.local/share/omf/pkg/omf/functions/core/omf.version.fish @ line 1
function omf.version
	command git -C "$OMF_PATH" describe --tags --match 'v*' --always | cut -c 2-
end
