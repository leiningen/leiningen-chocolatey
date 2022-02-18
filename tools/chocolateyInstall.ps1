$package = 'Leiningen'
$version = '2.9.8'
$checksumType = "sha256"
$checksum = "2a0e9114e0d623c748a9ade5d72b54128b31b5ddb13f51b04c533f104bb0c48d"
$url = "https://github.com/technomancy/leiningen/releases/download/${version}/leiningen-${version}-standalone.jar"

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