. $PSScriptRoot/Default.ps1
# $VerbosePreference = 'Continue'; # It is set to 'Continue' to ensure that the script displays verbose messages.

$items = 1..10
$items | ForEach-Object { # -ThrottleLimit $items.Count -Parallel {
   # . C:\Repo\Work\Internal\Demo\PowerShell\Default.ps1

   Write-DemoLog -Message "Begin of item $_..."
   Start-Sleep -Seconds 5
   Write-DemoLog -Message "End of item $_"
}
