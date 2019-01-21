
$psArmResourcesPath = "$HOME/Projects/PsArmResources"
(Test-Path $psArmResourcesPath) -and ($env:PsModulePath = $env:PSModulePath + ":$psArmResourcesPath")

$myTemp = "$HOME/.tmp"
(Test-Path $myTemp) -or (mkdir $myTemp)
$env:TEMP = "$HOME/.tmp"

Set-PSReadlineOption -EditMode Vi
Set-PSReadlineKeyHandler -Key Tab -Function Complete


