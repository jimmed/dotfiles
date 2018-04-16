# Defined in /home/jim/.config/fish/functions/weekly-stats.fish @ line 2
function weekly-stats --argument date weeks
	pushd ~/dev/mudano/query-hell
	echo "Generating queries for $date ($weeks weeks)"
	echo "COPY (" > /tmp/query-hell.sql
	node ./make-queries $date $weeks >> /tmp/query-hell.sql
	echo ") TO STDOUT WITH CSV DELIMITER ','" >> /tmp/query-hell.sql
	for env in "prodtest" "tbiprod" "lbgprod"
		echo "Uploading query to $env"
		scp /tmp/query-hell.sql $env:query-hell.sql
		echo "Running query on $env"
		ssh $env '. /etc/profile.d/rootenv.sh; . ~/.bashrc; psql -f query-hell.sql $RDS_PG > query-out.csv'
		echo "Retrieving results locally..."
		scp $env:query-out.csv ~/Desktop/$env-$date.csv
		echo "Cleaning up..."
		ssh $env "rm query-hell.sql query-out.csv"
	end

	pushd ~/Desktop
	rm -f all-$date.csv
	for env in lbgprod prodtest tbiprod;
		cat $env-$date.csv | sed "s/LBG\$/$env/gi" | sed "s/tbiprod\$/TBI/gi" | sed "s/lbgprod\$/LBG/gi" | sed "s/prodtest\$/ProdTest/gi" >> all-$date.csv
	end

	for env in LBG TBI ProdTest;
		echo -n "$env:"; cat all-$date.csv | grep -i $env | wc -l
	end

	echo -e "INSERT INTO stagingactiveuserraw (userid,name,email,recorddate,totalactivedays,isActive,planid,planname,sharktowerenv) VALUES" > all-$date.sql

	cat all-$date.csv | sed 's/\'/\'\'/g;s/^\([^,]\+\),\([^,]\+\),\([^,]\+\),\([^,]\+\),\([^,]\+\),\([^,]\+\),\([^,]\+\),\([^,]\+\)$/(\1, \'\2\', \'\3\', \'\4\' :: date, \5, \6, \'\7\', \'\8\'),/g;s/:: date, \([0-2]\),/:: date, \1, FALSE,/g;s/:: date, \([3-7]\),/:: date, \1, TRUE,/g' | tac | sed '1 s/,$/;/' | tac >> all-$date.sql

	mv all-$date.sql ~/dev/mudano/st-reporting/lib/data/queries/schema/rawData/

	rm -f *-$date.csv
	popd
	popd
end
