. $PSScriptRoot/Default.ps1
$VerbosePreference = 'Continue'; # It is set to 'Continue' to ensure that the script displays verbose messages.

Invoke-DemoSlowFunction -Value 1
# Clear-DemoCache
Invoke-DemoSlowFunction -Value 1
Invoke-DemoSlowFunction -Value 2
# Clear-DemoCache
Invoke-DemoSlowFunction -Value 2

# Show the cache logic
