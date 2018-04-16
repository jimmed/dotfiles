# Defined in /home/jim/.local/share/omf/pkg/omf/functions/compat/available.fish @ line 1
function available
	echo (status -t)[5] | read -la caller
  printf 'warning: function %savailable%s is deprecated and will be removed soon.\n' \
  (set_color -u) (set_color normal)

  contains input $caller
    or echo $caller

  type -q $argv
end
