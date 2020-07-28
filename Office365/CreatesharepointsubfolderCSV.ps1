#connect naar de site
$site = "vul hier de site waar je naartoe connect in"
Connect-PnPOnline $site -UseWebLogin
#vul pad naar CSV in, let op dat het CSV alleen de kolom Name bevat. deze waarde wordt de naam van de nieuwe map.
$namen = import-csv -Path "padnaarcsv" -Delimiter ';'
foreach ($item in $namen){
#vul hieronder het pad in NA de site waar je heen connect. stel je connect naar https://admin.sharepoint.com/sites/migratie, dan vul je bij het pad de document library in als eerste
# bijvoorbeeld Gedeelde Documenten/" je kan ook subfolders aangeven zoals "Gedeelde documenten/map1/map2" 
Add-PnPFolder -Name $item.name -Folder "vul hier het pad in"
write-host -f Green "ik ben nu bij $($item.name)"
}