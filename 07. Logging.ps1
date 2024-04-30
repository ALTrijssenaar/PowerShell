. $PSScriptRoot/Default.ps1

# $VerbosePreference = 'Continue'

Write-DemoFunctionWithLoggingPwSh -Message 'Hello, world!'
# Write-DemoFunctionWithLoggingCustom -Message 'Hello, world!'

# $WhatIfPreference = $true; # It is set to $true to ensure that the script does not make any changes and only displays what it would do.
# $paths = @((Join-Path -Path $HOME -ChildPath 'Demo1'), (Join-Path -Path $HOME -ChildPath 'Demo2')) 
# $paths | New-DemoPaths