# Defined in /tmp/fish.6brCo8/get_git_status.fish @ line 2
function get_git_status --description 'Gets the current git status'
	if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set -l dirty (command git status -s --ignore-submodules=dirty | wc -l | sed -e 's/^ *//' -e 's/ *$//' 2> /dev/null)
    set -l ref (command git describe --tags --exact-match ^/dev/null ; or command git symbolic-ref --short HEAD 2> /dev/null ; or command git rev-parse --short HEAD 2> /dev/null)

    if [ "$dirty" != "0" ]
      set_color -b 62A
      set_color white
      echo " $dirty "
      set_color -b magenta
      set_color white
    else
      set_color -b 271
      set_color white
    end

    echo " $ref "
    set_color normal
   end
end
