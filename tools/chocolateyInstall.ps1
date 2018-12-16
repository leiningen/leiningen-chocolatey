$package = 'Leiningen'
$version = '2.8.3'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$batDir = Join-Path $Env:ChocolateyInstall 'bin'
$lein = Join-Path $batDir 'lein.bat'

Write-Host "Copying lein.bat to $lein"
copy ${toolsDir}/lein.bat $lein

Write-Host "Executing bootstrap script from $batDir"
# $batDir is already in PATH
lein self-install
lein
lein version