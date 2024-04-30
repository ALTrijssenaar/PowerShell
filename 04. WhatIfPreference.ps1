$ErrorActionPreference = 'Stop'; # It is set to 'Stop' to ensure that any error that occurs in the script will be caught and handled.
Set-StrictMode -Version Latest; # It is set to 'Latest' to ensure that the script uses the latest version of the strict mode.

$WhatIfPreference = $false; # It is set to $false to ensure that the script makes changes.
# $WhatIfPreference = $true; # It is set to $true to ensure that the script does not make any changes and only displays what it would do.

function Format-Drive {
   # [CmdletBinding(SupportsShouldProcess = $true)]
   param (
      [string]$DriveLetter
   )

   Write-Host "Do some work..."

   Write-Host "Formatting drive $DriveLetter..."
   # if ($PSCmdlet.ShouldProcess($DriveLetter, 'Format drive')) {
   Write-Host "Processing..."
   Start-Sleep -Seconds 10
   # }
   Write-Host "Drive $DriveLetter formatted."

   Write-Host "Do some more work..."

   Write-Host "DONE!"
}

Format-Drive -DriveLetter 'C:' # -WhatIf

# Rules of thumb:
# 1. Use the -WhatIf parameter to test the script without making any changes to your target system
# 2. Read actions against your target system are allowed, so if a script is going to read data from a target system, it is required to provide -WhatIf:$false parameter

