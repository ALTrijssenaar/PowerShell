
function Get-DemoCache {
   [CmdletBinding()]
   param ()
   begin { . "$PSScriptRoot/../../begin.ps1" -InvocationInfo $MyInvocation }
   clean { . "$PSScriptRoot/../../clean.ps1" -InvocationInfo $MyInvocation }

   process {
      $globalCacheName = 'cached_operations'
      $cache = Get-Variable -Scope Global -Name $globalCacheName -ErrorAction SilentlyContinue
      if ($null -eq $cache) {
         Set-Variable -Scope Global -Name $globalCacheName -Value @{}
         $cache = Get-Variable -Scope Global -Name $globalCacheName -ErrorAction SilentlyContinue
      }
      return $cache.Value
   }
}