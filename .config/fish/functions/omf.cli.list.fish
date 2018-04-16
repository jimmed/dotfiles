# Defined in /home/jim/.local/share/omf/pkg/omf/functions/cli/omf.cli.list.fish @ line 1
function omf.cli.list
	switch (count $argv)
  case 0
    echo (set_color -u)Plugins(set_color normal)
    omf.packages.list --plugin | column
    echo
    echo (set_color -u)Themes(set_color normal)
    omf.packages.list --theme | column
  case '*'
    omf.packages.list $argv | column
  end
end
