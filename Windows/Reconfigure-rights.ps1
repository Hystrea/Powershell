#Made by Nick

#Download eerst NTFSSecurity module voor POSH en installeer deze
#https://gallery.technet.microsoft.com/scriptcenter/1abd77a5-9c0b-4a2b-acef-90dbb2b84e85
#run hierna pas het script


Import-Module NTFSSecurity
Import-Module ActiveDirectory

$Groups = Get-ADGroup -Filter *
$folderlist = get-childitem \\server\share | Where-object { $_.PSIsContainer }#Pas sharenaam aan #To-do Variabele aanmaken

Foreach($folder in $folderlist){
NEW-ADGroup –name “ACL_$($folder.name)_RW” -GroupCategory Security –Groupscope Global –path “OU=ACL,OU=COMPANY,DC=COMPANY,DC=local” #Pas OU en DC aan naar gegevens klant #To-do Variabele aanmaken
NEW-ADGroup –name “ACL_$($folder.name)_R” -GroupCategory Security –Groupscope Global –path “OU=ACL,OU=COMPANY,DC=COMPANY,DC=local” #Pas OU en DC aan naar gegevens klant #To-do Variabele aanmaken
}

Foreach($folder in $folderlist){
Disable-NTFSAccessInheritance -Path \\server\share\$($folder.name) -RemoveInheritedAccessRules
Get-NTFSAccess -path \\server\share\$($folder.name)| Remove-NTFSAccess
Add-NTFSAccess -Path \\server\share\$($folder.name) -Account "ACL_$($folder.name)_R" -AccessRights ReadAndExecute
Add-NTFSAccess -Path \\server\share\$($folder.name) -Account "ACL_$($folder.name)_RW" -AccessRights Modify 
Add-NTFSAccess -Path \\server\share\$($folder.name) -Account "Administrators" -AccessRights FullControl 
Write-Host "ik ben nu bij $folder"
}
