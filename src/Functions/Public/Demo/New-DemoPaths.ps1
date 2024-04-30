# Ensure that the provided path exists.
function New-DemoPaths {
   [CmdletBinding()]
   param (
      [Parameter(Mandatory, ValueFromPipeline)]
      [string[]]$Path
   )
   begin { . "$PSScriptRoot/../../begin.ps1" -InvocationInfo $MyInvocation }
   clean { . "$PSScriptRoot/../../clean.ps1" -InvocationInfo $MyInvocation }

   process {
      Write-DemoLog -Message "Ensure that the path [$Path] exists..."

      Get-DemoComputerInfo -Property OsName

      $Path | ForEach-Object {
         if (-not (Test-Path -Path $_)) {
            New-Item -Path $_ -ItemType Directory
         }
      }
   }
}