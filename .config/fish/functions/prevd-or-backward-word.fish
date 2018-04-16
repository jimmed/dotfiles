# Defined in /usr/share/fish/functions/prevd-or-backward-word.fish @ line 1
function prevd-or-backward-word
	set -l cmd (commandline)
    if test -z "$cmd"
        prevd
        commandline -f repaint
    else
        commandline -f backward-word
    end
end
