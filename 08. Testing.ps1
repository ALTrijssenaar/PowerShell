. $PSScriptRoot/Default.ps1

$VerbosePreference = 'Ignore'; # It is set to 'Ignore' to ensure that the script does not display verbose messages.
# $VerbosePreference = 'SilentlyContinue'; # It is set to 'SilentlyContinue' to ensure that the script does not display verbose messages.
# $VerbosePreference = 'Continue'; # It is set to 'Continue' to ensure that the script displays verbose messages.
$pesterConfig = New-PesterConfiguration
$pesterConfig.Run.Path = (Join-Path -Path $PSScriptRoot -ChildPath 'src/Functions')
$pesterConfig.Run.Throw = $true
$pesterConfig.Output.Verbosity = 'Detailed'
$pesterConfig.TestResult.Enabled = $true
Invoke-Pester -Configuration $pesterConfig