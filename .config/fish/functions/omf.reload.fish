# Defined in /home/jim/.local/share/omf/pkg/omf/functions/core/omf.reload.fish @ line 1
function omf.reload --description 'Reload fish process via exec, keeping some context'
	set -q CI; and return 0

  history --save
  set -gx dirprev $dirprev
  set -gx dirnext $dirnext
  set -gx dirstack $dirstack
  set -gx fish_greeting ''

  exec fish
end
