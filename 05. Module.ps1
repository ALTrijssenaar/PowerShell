$ErrorActionPreference = 'Stop'; # It is set to 'Stop' to ensure that any error that occurs in the script will be caught and handled.
Set-StrictMode -Version Latest; # It is set to 'Latest' to ensure that the script uses the latest version of the strict mode.

$VerbosePreference = 'SilentlyContinue'; # It is set to 'SilentlyContinue' to ensure that the script does not display verbose messages.
# $VerbosePreference = 'Continue'; # It is set to 'Continue' to ensure that the script displays verbose messages.
$WhatIfPreference = $false; # It is set to $false to ensure that the script makes changes.

# Manifest: New-ModuleManifest -Path ./src/Demo.psd1
# RootModule: ./src/Demo.psm1
Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath './src/Demo.psd1') -Force -Prefix Random # Import the Demo module manifest file.

$VerbosePreference = 'SilentlyContinue'; # It is set to 'SilentlyContinue' to ensure that the script does not display verbose messages.

Write-DemoFunction -Message 'Hello, world!'
# See -Prefix Random
# Write-RandomDemoFunction -Message 'Hello, world!'