Function ChkCert 
{
Param ($ip , [int] $port)
$TcpClient = New-Object -TypeName System.Net.Sockets.TcpClient
$tcpsocket = New-Object Net.Sockets.TcpClient($ip, $port)
$tcpstream = $tcpsocket.GetStream()
$Callback = { Param($Sender, $Cert, $Chain, $Errors) return $true }
$sslstream = New-Object -TypeName System.net.Security.SslStream -ArgumentList @($TcpStream, $True, $callback)
$sslStream.authenticateAsClient($ip)
$Certificate = New-Object -TypeName system.security.cryptography.x509certificates.x509certificate2($sslStream.RemoteCertificate)
$SslStream.Dispose()#test
$TcpClient.dispose()#test
Return $Certificate #test
}



function Show-Menu #keuzemenu voor verschillende VPN opties
{
     param (
           [string]$Title = 'Menu'
     )
     cls
     Write-Host "================ $Title ================"
    
     Write-Host @"
     1: VPN Aanmaken
     2: VPN Verwijderen
     3: IP-Adressen
     4: CertificaatChecker
     5: Remote Gateway Uitzetten
     Q: Quit
"@
 
}
do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                cls
                'VPN Aanmaken'
                $VPNName = Read-Host -Prompt 'VPN Name?'
                $VPNServerAddress = Read-host -Prompt 'what is the ServerAddress?'
                Write-Host "Trying to create $VPNName" -ForegroundColor Yellow
                Add-VpnConnection -Name $VPNName -ServerAddress $VPNServerAddress -TunnelType SSTP -EncryptionLevel Optional -AuthenticationMethod CHAP, MSChapv2  -AllUserConnection -PassThru -verbose
           } '2' {
                cls
                'VPN Verwijderen'
                 $VPNRemoveName = Read-Host -Prompt 'Which VPN Connection do you want to remove?'
                 Write-Host "Trying to remove $VPNRemoveName" -ForegroundColor Yellow
                 Remove-VpnConnection -Name $VPNRemoveName -AllUserConnection -Verbose
                 
           } '3' {
                cls
                Write-host "Alle IP's op jouw apparaat" -foregroundcolor Yellow
                ipconfig /all
                } '4' {
                $doel = Read-Host -Prompt 'VPN Address?'
                Write-host "Trying to get SSL certificate for $doel" -ForegroundColor "Yellow"
                $certificate = chkcert $doel 443
                $date = (Get-Date)
                $cert = $certificate.notafter.ToShortDateString() 
                write-host $certificate.issuer -ForegroundColor "Magenta"
                If ($date -le $cert){
                write-host $certificate.notafter  -ForegroundColor "Green"
                }
                Else{
                write-host $Certificate.notafter -ForegroundColor "Red"
                }  
                } '5' {
                $VPNNameVraag = Read-Host -Prompt 'Which VPN do you want to disable this for'
                Write-Host "Trying to disable Remote gateway on $VPNNameVraag" -ForegroundColor Yellow
                Get-VPNConnection | Set-VpnConnection $VPNNameVraag -SplitTunneling $True -verbose
                      
           }'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q') 

