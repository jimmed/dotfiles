# Defined in /home/jim/.local/share/omf/pkg/omf/functions/packages/omf.packages.new.fish @ line 41
function omf.packages.new --argument option name
	switch $option
    case "p" "plugin"
      set option "pkg"
    case "t" "th" "the" "thm" "theme" "themes"
      set option "themes"
    case "*"
      echo (omf::err)"$option is not a valid option."(omf::off) >&2
      return $OMF_INVALID_ARG
  end

  if not omf.packages.valid_name "$name"
    echo (omf::err)"$name is not a valid package/theme name"(omf::off) >&2
    return $OMF_INVALID_ARG
  end

  if set -l dir (__omf.packages.new.mkdir "$option/$name")
    cd $dir

    set -l github (git config github.user)
    test -z "$github"; and set github "{{USER}}"

    set -l user (git config user.name)
    test -z "$user"; and set user "{{USER}}"

    __omf.packages.new.from_template "$OMF_PATH/pkg/omf/templates/$option" \
      $github $user $name

    echo (omf::em)"Switched to $dir"(omf::off)
  else
    echo (omf::err)"\$OMF_CONFIG and/or \$OMF_PATH undefined."(omf::off) >&2
    exit $OMF_UNKNOWN_ERR
  end
end
