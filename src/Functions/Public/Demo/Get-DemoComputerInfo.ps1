
function Get-DemoComputerInfo {
   [CmdletBinding()]
   param (
      [Parameter(Mandatory = $true)]
      [ValidateSet('OsName', 'OsType')]
      [string] $Property
   )
   begin { . "$PSScriptRoot/../../begin.ps1" -InvocationInfo $MyInvocation }
   clean { . "$PSScriptRoot/../../clean.ps1" -InvocationInfo $MyInvocation }

   process {
      Write-DemoLog -Message "Getting computer info for property [$Property]..."

      (Get-ComputerInfo -Property $Property).$Property

      Write-DemoLog -Message "Get computer info for property [$Property]"
   }
}