# Defined in /home/jim/.local/share/omf/lib/autoload.fish @ line 1
function autoload
	switch "$argv[1]"
  case '-e' '--erase'
    test (count $argv) -ge 2
      and __autoload_erase $argv[2..-1]
      or echo "usage: autoload $argv[1] <path>..." >&2
  case "-*" "--*"
    echo "autoload: invalid option $argv[1]"
    return 1
  case '*'
    test (count $argv) -ge 1
      and __autoload_insert $argv
      or echo "usage: autoload <path>..." >&2
  end
end
