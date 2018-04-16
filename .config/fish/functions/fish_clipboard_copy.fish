# Defined in /usr/share/fish/functions/fish_clipboard_copy.fish @ line 1
function fish_clipboard_copy
	if type -q pbcopy
        commandline | pbcopy
    else if type -q xsel
        commandline | xsel --clipboard
    end
end
