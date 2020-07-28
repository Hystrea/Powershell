#vul pad naar CSV in
#bij het maken van het CSV, gebruik 2 kolommen met de naam User en Extra. als je meerdere adressen opgeeft, splits deze dan met een ,
$alias = import-csv "pad naar het CSV" -delimiter ';'| foreach-object {
$gebruiker = $_.user
$proxyadresses = $_.Extra -split ','
set-mailbox -identity $gebruiker -emailaddresses @{Add= $proxyadresses}
write-host -f Green "Adding the following addresses to $($gebruiker): $($proxyadresses)"
}