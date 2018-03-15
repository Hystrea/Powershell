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


$welkeuser = Read-Host "Wat is het emailadres van de gebruiker"
$gebruiker = Read-Host "Wie moet de rechten krijgen? (emailadres)"
$agenda = Read-Host "Calendar, Agenda of Kalender"

Add-MailboxFolderPermission -identity "$($welkeuser):\$($agenda)" -user $gebruiker -AccessRights PublishingEditor