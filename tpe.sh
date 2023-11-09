if [ $# -ne 2 ]
then
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
season_id=$(java net.sf.saxon.Query "seasons_file=$SEASONS_FILE" "season_prefix=$name_prefix" "season_year=$year" ./queries/extract_season_id.xq)

# Call to information and lineups endpoint
./scripts/season_info.sh $SEASON_INFO_FILE $season_id
./scripts/season_lineups.sh $SEASON_LINEUPS_FILE $season_id

echo $?

### COSAS QUE FALTAN
#   - Intercomunicacion con xq que genera xml con la data para pasarle estados de error previos.
#   - En caso de que la informacion sea correcta, validar contra el xsd el xml generado.

### ERRORES POSIBLES HASTA ACA
#   - Cannot convert string "a" to an integer (no entero en $2)
#   - Id no encontrado !!! NO HANDLEA, guarda EMPTY en season_id
