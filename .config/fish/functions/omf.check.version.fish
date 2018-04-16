# Defined in /home/jim/.local/share/omf/pkg/omf/functions/util/omf.check.version.fish @ line 1
function omf.check.version --argument min_version current_version
	test (echo "$min_version"\n"$current_version" | tr '.' ' ' | sort -n | head -n1) = (echo "$min_version" | tr '.' ' ')
end
