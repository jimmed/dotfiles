# Defined in /home/jim/.config/fish/functions/at-work-desk.fish @ line 2
function at-work-desk
	external-monitor --auto --above eDP1
  external-monitor --dpi 96
  nitrogen --restore
end
