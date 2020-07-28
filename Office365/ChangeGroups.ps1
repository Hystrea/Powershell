$groups = import-csv "pad naar het CSV" -Delimiter ';'
#bouw het CSV op met Name (huidige naam), Newname (nieuwe naam) en Alias (aliassen). LET OP, je kan maar 1 alias tegelijk toevoegen op deze manier. zie AddMultiAlias voor meerdere aliassen.
foreach($item in $groups){
set-distributiongroup -identity $item.name -primarysmtpaddress $item.newname -emailaddresses @{Add= $item.alias} 
write-host "Changing $($item.name) to $($item.newname) and adding $($item.alias) as a Proxy address"
}