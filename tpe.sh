if [ $# -ne 2 ]
then
    # TIENE QUE DEVOLVERLO EL MARKDOWN
    echo "Error: two arguments (name_prefix, year) were expected, but $# were received."
    exit 1
fi

SEASONS_FILE=seasons.xml
SEASON_INFO_FILE=season_info.xml
SEASON_LINEUPS_FILE=season_lineups.xml

name_prefix=$1
year=$2

# Call to seasons endpoint
./scripts/seasons.sh $SEASONS_FILE

# Get season id for name_prefix and year received
java net.sf.saxon.Query "seasons_file=$SEASONS_FILE" "season_prefix=$name_prefix" "season_year=$year" ./queries/extract_season_id.xq


