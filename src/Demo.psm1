$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# Load all private functions
$privateScripts = Get-ChildItem -Path $PSScriptRoot/Functions/Private -File -Filter '*.ps1' -Recurse -Exclude '*.Tests.ps1'
foreach ($script in $privateScripts) {
   if ($script.Name -eq 'begin.ps1' -or $script.Name -eq 'clean.ps1') {
      continue
   }

   . $script.FullName
}

# Load all public functions and export them
$publicScripts = Get-ChildItem -Path $PSScriptRoot/Functions/Public -File -Filter '*.ps1' -Recurse -Exclude '*.Tests.ps1'
foreach ($script in $publicScripts) {
   if ($script.Name -eq 'begin.ps1' -or $script.Name -eq 'clean.ps1') {
      continue
   }

   . $script.FullName
   Export-ModuleMember -Function $script.BaseName
}