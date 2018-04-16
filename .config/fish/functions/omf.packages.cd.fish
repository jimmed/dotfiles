# Defined in /home/jim/.local/share/omf/pkg/omf/functions/packages/omf.packages.cd.fish @ line 7
function omf.packages.cd --description 'Change the current working directory to plugin / theme home directory.' --argument name
	if test -z "$name"
    pushd $OMF_PATH
    return 0
  end

  for path in {$OMF_CONFIG,$OMF_PATH}/{pkg,themes}/$name
    if test -e "$path"
      pushd $path
      return 0
    end
  end

  echo (omf::err)"$name is not a valid package/theme name"(omf::off) >&2
  return $OMF_INVALID_ARG
end
