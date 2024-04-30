function Write-DemoFunction {
   [CmdletBinding()]
   param
   (
      [Parameter(Mandatory = $true)]
      [string] $Message
   )

   Write-Verbose $Message
   Write-Host $Message
}