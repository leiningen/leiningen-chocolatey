$package = 'Leiningen'
$version = '2.7.1'

$url = "https://github.com/technomancy/leiningen/raw/$version/bin/lein.bat"

$batDir = Join-Path $Env:ChocolateyInstall 'bin'
$lein = Join-Path $batDir 'lein.bat'

Write-Host "Downloading from $url"

# Download from an HTTPS location
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName "$package" -FileFullPath "$lein" -Url "$url"
Write-Host "Download from $url complete"

Write-Host "Executing bootstrap script from $batDir"
# $batDir is already in PATH
lein self-install
lein
lein version
