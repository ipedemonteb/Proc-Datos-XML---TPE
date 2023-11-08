mkdir -p data
curl "http://api.sportradar.us/rugby-league/trial/v3/en/seasons.xml?api_key=${API_KEY}" -o ./data/$1
java net.sf.saxon.Transform -s:data/$1 -xsl:helpers/remove_namespaces.xsl -o:data/$1