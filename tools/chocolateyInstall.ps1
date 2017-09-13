$package = 'Leiningen'
$version = '2.7.1'
$checksum = '32385e54b54ec99ac8a37792347ca4f1a3c7feb792066d7ffc8f1e4c5b7c7ad1'

$url = "https://raw.githubusercontent.com/technomancy/leiningen/$version/bin/lein.bat"

$batDir = Join-Path $Env:ChocolateyInstall 'bin'
$lein = Join-Path $batDir 'lein.bat'

Write-Host "Downloading from $url"

# Download from an HTTPS location
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName "$package" -FileFullPath "$lein" -Url "$url" -CheckSumType "sha256" -Checksum "$checksum"
Write-Host "Download from $url complete"

Write-Host "Executing bootstrap script from $batDir"
# $batDir is already in PATH
lein self-install
lein
lein version
