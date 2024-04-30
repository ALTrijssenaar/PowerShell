class CachedOperation {
   # Automatic TimeStamp
   [DateTime] $TimeStamp

   # Command Instructions
   [ScriptBlock] $CacheResultOf

   # Output, whatever it is
   [psCustomObject] $Value

   #Constructor
   CachedOperation ([ScriptBlock]$CacheResultOf) {
      $this.TimeStamp = [DateTime]::UtcNow
      $this.Value = $CacheResultOf.Invoke()
   }
}

function Get-DemoCachedOperation {
   [CmdletBinding()]
   param (
      [Parameter(Mandatory)]
      [ScriptBlock]$CacheResultOf, 
      [Parameter(Mandatory = $false)]
      [int]$MaxMinutes = 1, 
      [Switch]$Force
   ) 
   begin { . "$PSScriptRoot/../../begin.ps1" -InvocationInfo $MyInvocation }
   clean { . "$PSScriptRoot/../../clean.ps1" -InvocationInfo $MyInvocation }

   process {
      $cache = Get-DemoCache

      $key = $ExecutionContext.InvokeCommand.ExpandString($CacheResultOf)
      $cacheValue = $cache[$key] # | Select-Object -ExpandProperty Value

      $needsEvaluation = $true
      if ($Force) {
         Write-DemoLog -Message "Forced, evaluating..."
      }
      elseif ($null -eq $cacheValue) {
         Write-DemoLog -Message "No cached results found, evaluating..."
      }
      elseif ($cacheValue.TimeStamp -lt [DateTime]::UtcNow.AddMinutes(-$MaxMinutes)) {
         Write-DemoLog -Message "Cached results too old, reevaluating..." 
      }
      else {
         Write-DemoLog -Message "Found cached result..."
         $needsEvaluation = $false
      }

      if ($needsEvaluation) {
         $currentValue = [CachedOperation]::new($CacheResultOf) 
         $cache[$key] = $currentValue
         $cacheValue = $currentValue
      }

      return $cacheValue.Value
   }
}
