# Proc.-Datos-XML---TPE

Comandos:

- ./scripts/seasons.sh filename.xml
- ./scripts/season_info.sh <file_name>.xml <season_id>
- ./scripts/season_lineups.sh <file_name>.xml <season_id>
- java net.sf.saxon.Query "seasons_file=seasons.xml" "season_prefix=Super League" "season_year=2023" ./queries extract_season_id.xq
