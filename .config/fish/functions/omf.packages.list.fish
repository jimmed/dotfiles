# Defined in /home/jim/.local/share/omf/pkg/omf/functions/packages/omf.packages.list.fish @ line 4
function omf.packages.list --description 'List installed packages'
	set -l show_plugins
  set -l show_themes

  if begin; contains -- --plugin $argv; or contains -- -p $argv; end
    set -e show_themes
  end

  if begin; contains -- --theme $argv; or contains -- -t $argv; end
    set show_themes
    set -e show_plugins
  end

  set -l plugins_paths $OMF_PATH/pkg/*
  set -l themes_paths $OMF_PATH/themes/*

  if set -q show_plugins
    for path in $plugins_paths
      contains $path $builtin_packages; or command basename $path
    end
  end

  if set -q show_themes
    for path in $themes_paths
      command basename $path
    end
  end
end
