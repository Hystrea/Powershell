$users = import-csv "vul hier het pad in naar het CSV bestand" -Delimiter ';'
#bouw het CSV op met de Name (huidige naam) en newname (nieuwe naam) waarden.
foreach($item in $users){
#Set-MsolUserPrincipalName -UserPrincipalName $item.name -NewUserPrincipalName $item.newname
write-host -f Green "changing $($item.name) to $($item.newname)"
}
