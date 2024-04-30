param (
    [Parameter(Mandatory = $true)]
    [System.Management.Automation.InvocationInfo] $InvocationInfo
)

if ($VerbosePreference -ne "Continue") {
    return
}

Write-DemoEndInvocationInfo -InvocationInfo $InvocationInfo -Stopwatch $stopwatch
