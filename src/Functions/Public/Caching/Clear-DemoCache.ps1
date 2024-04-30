function Clear-DemoCache {
   [CmdletBinding()]
   param ()
   begin { . "$PSScriptRoot/../../begin.ps1" -InvocationInfo $MyInvocation }
   clean { . "$PSScriptRoot/../../clean.ps1" -InvocationInfo $MyInvocation }

   process {
      $cache = Get-DemoCache
      $cache.Clear()
   }
}