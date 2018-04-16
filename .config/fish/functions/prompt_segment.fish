# Defined in /home/jim/.config/fish/functions/prompt_segment.fish @ line 2
function prompt_segment --description 'Function to show a segment'
	# Get colors
  set -l bg $argv[1]
  set -l fg $argv[2]

  # Set 'em
  set_color -b $bg
  set_color $fg

  # Print text
  if [ -n "$argv[3]" ]
    echo -n -s $argv[3]
  end
end
