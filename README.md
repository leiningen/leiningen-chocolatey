# README

This is the [Leiningen](https://leiningen.org) package for [chocolatey.org](https://chocolatey.org).

Forked from https://github.com/Iristyle/ChocolateyPackages

**Update 2022-07:** This repository is now hosted at https://codeberg.org/wink/leiningen-chocolatey

# How to release

  * bump the version string in the affected files:
    * `CHANGELOG.md`
    * `Leiningen.nuspec`
    * `tools/chocolateyInstall.ps1`
  * check if `tools/lein.bat` has actually changed or if it's just the version string
  * download `leiningen-$VERS-standalone.jar` and do a `sha256sum` on it, that goes into  `tools/chocolateyInstall.ps1`
  * package
    * `choco pack`
  * test locally
    * `choco install Lein*.nupkg`
    * alternatively `choco install lein -dv -s .`
  * upload
    * `choco apikey --key APIKEY --source https://push.chocolatey.org`
    * `choco push Lein-VERSION.nupkg -s https://push.chocolatey.org/`
    * retry push if it fails
  * wait until the automated checks pass
  * wait until it's moderated

## Recommended reading for releases

  * https://chocolatey.org/docs/create-packages#package-fix-version-notation
  * https://chocolatey.org/docs/create-packages#build-your-package
