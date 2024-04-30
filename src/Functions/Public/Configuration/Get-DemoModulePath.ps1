function Get-DemoModulePath {
   [CmdletBinding()]
   param (
      [Parameter()]
      [String]
      $ModuleName,
      [Parameter()]
      [String]
      $Path
   )
   begin { . "$PSScriptRoot/../../begin.ps1" -InvocationInfo $MyInvocation }
   clean { . "$PSScriptRoot/../../clean.ps1" -InvocationInfo $MyInvocation }

   process {
      $module = Get-Module -Name $ModuleName
      $result = (Get-Item -Path $module.Path).Directory.FullName
      if ($null -ne $Path) {
         $result = Join-Path -Path $result -ChildPath $Path
      }
      return $result
   }
}