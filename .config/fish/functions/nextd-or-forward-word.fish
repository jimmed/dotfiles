# Defined in /usr/share/fish/functions/nextd-or-forward-word.fish @ line 1
function nextd-or-forward-word
	set -l cmd (commandline)
    if test -z "$cmd"
        nextd
        commandline -f repaint
    else
        commandline -f forward-word
    end
end
