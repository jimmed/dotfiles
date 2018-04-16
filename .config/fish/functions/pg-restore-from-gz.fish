# Defined in /home/jim/.config/fish/functions/pg-restore-from-gz.fish @ line 2
function pg-restore-from-gz --argument database file
	zcat $file | psql -f - $database
end
