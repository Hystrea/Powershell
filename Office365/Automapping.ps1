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

$welke = Read-host 'Welke mailbox gaat het om'
$wie = Read-host 'Wie moet er zonder automapping rechten krijgen?'

Remove-Mailboxpermission -identity $welke -user $wie -AccessRights FullAccess
Add-mailboxpermission -identity $welke -user $wie -AccessRights FullAccess -Automapping $False