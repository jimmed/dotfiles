# Defined in /home/jim/.local/share/omf/pkg/omf/functions/cli/omf.cli.channel.fish @ line 1
function omf.cli.channel
	switch (count $argv)
    case 0
      omf.channel.get

    case 1
      omf.channel.set $argv

    case '*'
      echo (omf::err)"Invalid number of arguments"(omf::off) >&2
      omf help channel
      return $OMF_INVALID_ARG
  end
end
