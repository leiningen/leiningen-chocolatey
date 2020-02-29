$package = 'Leiningen'
$version = '2.9.2'

$installDir = Join-Path $Env:USERPROFILE '.lein'
if (Test-Path $installDir)
{
  Remove-Item $installDir -Recurse -ErrorAction SilentlyContinue
}

$batDir = Join-Path $Env:ChocolateyInstall 'bin'
$lein = Join-Path $batDir 'lein.bat'
if (Test-Path $lein)
{
  Remove-Item $lein -ErrorAction SilentlyContinue
}
Write-Host "Uninstalling $package $version complete."