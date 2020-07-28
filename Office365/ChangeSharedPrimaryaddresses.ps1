# vul pad naar CSV in
$mailboxes = import-csv "pad naar csv" -Delimiter ';'
#bouw het CSV op met de kolommen name (huidige naam) en newname (nieuwe naam)
foreach($item in $mailboxes){
set-mailbox -identity $item.name -emailaddress $item.newname
write-host -f Green "changing $($item.name) to $($item.newname)"
}