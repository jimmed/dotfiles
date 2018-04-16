# Defined in /usr/share/fish/config.fish @ line 206
function fish_sigtrap_handler --description 'Signal handler for the TRAP signal. Launches a debug prompt.' --no-scope-shadowing --on-signal SIGTRAP
	breakpoint
end
