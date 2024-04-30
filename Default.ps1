$ErrorActionPreference = 'Stop'; # It is set to 'Stop' to ensure that any error that occurs in the script will be caught and handled.
Set-StrictMode -Version Latest; # It is set to 'Latest' to ensure that the script uses the latest version of the strict mode.

$VerbosePreference = 'SilentlyContinue'; # It is set to 'SilentlyContinue' to ensure that the script does not display verbose messages.
$WhatIfPreference = $false; # It is set to $false to ensure that the script makes changes.

Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath './src/Demo.psd1') -Force # Import the Demo module manifest file.