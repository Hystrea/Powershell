$FONTS = 0x14
$Path="c:\nieuwefontstemp"
$Startpath = Read-host "Waar staan de fontfiles? eindig het volledige pad met \*"
$objShell = New-Object -ComObject Shell.Application
$objFolder = $objShell.Namespace($FONTS)

New-Item $Path -type directory
Copy-Item $Startpath $Path

$Fontdir = dir $Path
$FontTester = Get-Childitem "C:\Windows\Fonts" 
$FileTester = Get-ChildItem $Path
$Comparison = Compare-Object -DifferenceObject $FontTester -ReferenceObject $FileTester -Property Name, SideIndicator -IncludeEqual

foreach($File in $Fontdir) 
{
if ($Comparison.SideIndicator -eq '==' ) {

Write-Host "bestaat al!"
}
Else {    
   
$objFolder.CopyHere($File.fullname) 
}
}

Remove-Item $Path -Recurse