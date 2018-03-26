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

[array]$WieMoetInDeAgenda = (Read-Host "Wie moet er toegang krijgen? (opslitsen met ,)").split(",") | %{$_.trim()}
     
     [array]$accounts = (Read-Host "welke e-mailadressen (opsplitsen met ,)").split(“,”) | %{$_.trim()} 
     
     
     foreach ($accountalias in $accounts){
                   $folders = Get-MailboxFolderStatistics -identity $accountalias | Where-Object {$_.FolderType -eq "Calendar"}
         foreach ($gebruiker in $WieMoetInDeAgenda){
                   foreach($folder in $folders) {
                          $foldername = $folder.Name
                          write-host "Trying to set permissions for $gebruiker to $($accountalias):\$($foldername)" -ForegroundColor Green
                          Get-MailboxFolderPermission -Identity "$($accountalias):\$($foldername)" -User $Gebruiker -AccessRights PublishingEditor
                                                 }
                                                 }
                                                 }