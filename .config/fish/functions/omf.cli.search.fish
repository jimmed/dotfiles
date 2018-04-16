# Defined in /home/jim/.local/share/omf/pkg/omf/functions/cli/omf.cli.search.fish @ line 1
function omf.cli.search --description 'Searches all available packages'
	switch (count $argv);
    case 1;
      omf.index.update --if-missing

      echo (omf::under)"Plugins"(omf::off)
      __omf.cli.search.output --type=plugin --text=$argv[1]
      echo
      echo (omf::under)"Themes"(omf::off)
      __omf.cli.search.output --type=theme --text=$argv[1]

    case 2;
      omf.index.update --if-missing

      switch "$argv[1]"
        case "-p" "--plugin";
          __omf.cli.search.output --type=plugin --text=$argv[2]
        case "-t" "--theme";
          __omf.cli.search.output --type=theme --text=$argv[2]
        case '*';
          omf.cli.help search
          return 1
      end

    case '*';
      omf.cli.help search
      return 1
  end

  return 0
end
