# Defined in /home/jim/.local/share/omf/pkg/omf/functions/cli/omf.cli.new.fish @ line 1
function omf.cli.new
	if test (count $argv) -ne 2
    echo (omf::err)"Package type or name missing"(omf::off) >&2
    return $OMF_MISSING_ARG
  end
  omf.packages.new $argv
end
