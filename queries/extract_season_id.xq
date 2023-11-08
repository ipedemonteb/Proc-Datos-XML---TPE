declare option saxon:output "method=text";
declare variable $season_prefix as xs:string external;
declare variable $season_year as xs:integer external;


let $result := doc("../data/seasons.xml")//seasons/season[fn:contains(@name,$season_prefix) and @year = $season_year][1]/@id
return string($result)

(:
El [1] al final de la consulta hace que se devuelva el primer elemento que encuentra si hay varios
con el mismo prefix e year.
:)