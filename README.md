# README

This is the [Leiningen](https://leiningen.org) package for [chocolatey.org](https://chocolatey.org).

Forked from https://github.com/Iristyle/ChocolateyPackages

# How to release

  * if it's just a version bump:
    * bump the version string in the affected files
  * package
    * `choco pack`
  * test locally
    * `choco install lein -dv -s .`
  * upload
    * `choco apikey --key APIKEY --source https://push.chocolatey.org`
    * `choco push Lein-VERSION.nupkg -s https://push.chocolatey.org/`
    * retry push if it fails
  * wait until the automated checks pass
  * wait until it's moderated

## Recommended reading for releases

  * https://chocolatey.org/docs/create-packages#package-fix-version-notation
  * https://chocolatey.org/docs/create-packages#build-your-package
