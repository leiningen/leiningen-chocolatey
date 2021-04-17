$package = 'Leiningen'
$version = '2.9.6'
$checksumType = "sha256"
$checksum = "41c543f73eec4327dc20e60d5d820fc2a9dc772bc671610b9c385d9c4f5970b8"
$url = "https://github.com/technomancy/leiningen/releases/download/${version}/leiningen-${version}-standalone.zip"

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$batDir = Join-Path $Env:ChocolateyInstall 'bin'
$lein = Join-Path $batDir 'lein.bat'

Write-Host "Copying lein.bat to ${lein}"
Copy-Item ${toolsDir}/lein.bat -Destination $lein

$localTempPath = "${toolsDir}\leiningen-${version}-standalone.jar"
$installPath = Join-Path $Env:USERPROFILE '.lein'
$installPath = Join-Path $installPath 'self-installs'
New-Item -Path $installPath -Type Directory
$installPath = Join-Path $installPath "leiningen-${version}-standalone.jar"

Get-ChocolateyWebFile -PackageName 'lein' `
    -FileFullPath $localTempPath -Url $url `
    -CheckSumType $checksumType -CheckSum $checksum

Move-Item $localTempPath -Destination $installPath

Write-Host "Executing ${package} bootstrap script from ${batDir}"
# $batDir is already in PATH
lein
lein version