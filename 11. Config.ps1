. $PSScriptRoot/Default.ps1
# $VerbosePreference = 'Continue'; # It is set to 'Continue' to ensure that the script displays verbose messages.

Get-DemoModulePath -ModuleName 'Demo' -Path 'Files/terraform'
Get-DemoModulePath -ModuleName 'Demo' -Path 'Files/ansible'
