## Configures a Sharepoint Online site in Legacy mode
Write-Host "Voer de domeinnaam van je Sharepoint website in. Bijv. https://limenetworks-admin.sharepoint.com" -BackgroundColor Green -ForegroundColor Black
$Sharepoint = Read-Host 'Voer hier de gehele Sharepoint URL in'
Connect-SPOService -URL $Sharepoint
Set-SPOTenant -LegacyAuthProtocolsEnabled $True