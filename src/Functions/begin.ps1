param (
   [Parameter(Mandatory = $true)]
   [System.Management.Automation.InvocationInfo] $InvocationInfo
)

if ($VerbosePreference -ne "Continue") {
   return
}

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
Write-DemoStartInvocationInfo -InvocationInfo $InvocationInfo