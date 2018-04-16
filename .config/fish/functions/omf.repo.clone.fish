# Defined in /home/jim/.local/share/omf/pkg/omf/functions/repo/omf.repo.clone.fish @ line 1
function omf.repo.clone --argument url path
	command git clone --quiet $url $path
end
