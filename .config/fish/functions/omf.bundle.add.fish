# Defined in /home/jim/.local/share/omf/pkg/omf/functions/bundle/omf.bundle.add.fish @ line 1
function omf.bundle.add --argument type name_or_url
	set -l bundle $OMF_CONFIG/bundle

  if test -L $OMF_CONFIG/bundle
    set bundle (readlink $OMF_CONFIG/bundle)
  end

  set -l record "$type $name_or_url"

  if test -f $bundle
    if not grep $record $bundle > /dev/null ^&1
      echo $record >> $bundle
    end
  else
    echo $record > $bundle
  end

  sort -u $bundle -o $bundle
end
