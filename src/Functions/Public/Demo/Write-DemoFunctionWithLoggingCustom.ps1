function Write-DemoFunctionWithLoggingCustom {
   [CmdletBinding()]
   param
   (
      [Parameter(Mandatory = $true)]
      [string] $Message
   )
   begin { . "$PSScriptRoot/../../begin.ps1" -InvocationInfo $MyInvocation }
   clean { . "$PSScriptRoot/../../clean.ps1" -InvocationInfo $MyInvocation }

   process {
      Write-DemoLog $Message -Trace
      Write-DemoLog $Message
   }
}
