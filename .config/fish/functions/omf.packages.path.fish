# Defined in /home/jim/.local/share/omf/pkg/omf/functions/packages/omf.packages.path.fish @ line 1
function omf.packages.path --argument name
	for path in {$OMF_CONFIG,$OMF_PATH}/{themes,pkg}/$name
    if test -e $path
      echo $path
      return 0
    end
  end

  return 1
end
