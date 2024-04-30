function Invoke-DemoSlowFunction {
   [CmdletBinding()]
   param (
      [Parameter(Mandatory = $true)]
      [string] $Value
   )
   begin { . "$PSScriptRoot/../../begin.ps1" -InvocationInfo $MyInvocation }
   clean { . "$PSScriptRoot/../../clean.ps1" -InvocationInfo $MyInvocation }

   process {
      $scriptBlock = {
         Start-Sleep 3
         return $Value 
      }

      return Get-DemoCachedOperation -CacheResultOf $scriptBlock -MaxMinutes 1
   }
}
