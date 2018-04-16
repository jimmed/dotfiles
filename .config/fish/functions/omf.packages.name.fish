# Defined in /home/jim/.local/share/omf/pkg/omf/functions/packages/omf.packages.name.fish @ line 1
function omf.packages.name --argument name_or_url
	command basename $name_or_url | sed -E 's/^(omf-)?((plugin|pkg|theme)-)?//;s/.git$//'
end
