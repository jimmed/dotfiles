# Defined in /home/jim/.config/fish/functions/pg-nuke.fish @ line 2
function pg-nuke --argument database
	echo "Nuking local postgres database '$database' from orbit..."
	psql -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public" $database
end
