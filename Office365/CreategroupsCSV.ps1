$distrigroups = import-csv -path "vul hier je pad in naar het CSV bestand" -delimiter ';'
# bouw het CSV op met tenminste de volgende waarden: Displayname, Grouptype (security of distribution), Alias (niet te verwarren met proxyadresses) en Emailaddress
foreach ($item in $distrigroups){
New-distributiongroup -name $item.displayname -type $item.grouptype -alias $item.alias -primarysmtpaddress $item.emailaddress
write-host -f Green "ik ben nu bij $($item)"
}