 Import-Module MSonline
    # Capture administrative credentials.
        Write-Host "Enter credentials of the tenant you want information from:" -BackgroundColor Green -ForegroundColor Black
        $Credential = Get-Credential
    # Establishes Online Services connection to Azure Active Directory.
        Write-Host "Connecting to Microsoft Online Services..." -BackgroundColor Green -ForegroundColor Black
        Connect-MsolService -Credential $Credential
    # Import Microsoft.Exchange PSSession for Exchange Online cmdlets.
        $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $Credential -Authentication Basic -AllowRedirection 
        Import-PSSession $Session -AllowClobber 3> $null


$WieMoetInDeAgenda = Read-Host -Prompt "Wie moet er toegang krijgen?"

$users = Get-Mailbox -RecipientTypeDetails UserMailBox 

foreach($user in $users) {

$useralias = $user.PrimarySMTPAddress

$folders = Get-MailboxFolderStatistics -identity $useralias | Where-Object {$_.FolderType -eq "Calendar"}

foreach($folder in $folders){
$foldername = $folder.Name
write-host "Trying to set permissions for $wiemoetindeagenda to $($useralias):\$($foldername)" -ForegroundColor Green
Add-MailboxFolderPermission -Identity "$($useralias):\$($foldername)" -User $WieMoetInDeAgenda -AccessRights PublishingEditor
}
}