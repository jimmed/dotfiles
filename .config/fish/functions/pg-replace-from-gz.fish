# Defined in /home/jim/.config/fish/functions/pg-replace-from-gz.fish @ line 2
function pg-replace-from-gz --argument file database
	pg-nuke $database; and pg-restore-from-gz $database $file
end
