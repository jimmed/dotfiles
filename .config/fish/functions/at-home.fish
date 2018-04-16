# Defined in /home/jim/.config/fish/functions/at-home.fish @ line 2
function at-home
	internal-monitor --auto
  external-monitor --off
  nitrogen --restore
end
