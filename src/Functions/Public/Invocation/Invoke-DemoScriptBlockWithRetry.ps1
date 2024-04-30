function Invoke-DemoScriptBlockWithRetry {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [Scriptblock] $Scriptblock,
        [Parameter(Mandatory = $false)]
        [int] $MaxAttempts = 3,
        [Parameter(Mandatory = $false)]
        [int] $DelayInSeconds = 10,
        [Parameter(Mandatory = $false)]
        [switch] $StartWithDelay = $false
    )
    begin { . "$PSScriptRoot/../../begin.ps1" -InvocationInfo $MyInvocation }
    clean { . "$PSScriptRoot/../../clean.ps1" -InvocationInfo $MyInvocation }

    process {
        $attempts = 1
        
        do {
            if ($StartWithDelay) {
                Start-Sleep -Seconds $DelayInSeconds
            }

            try {
                return Invoke-Command -ScriptBlock $Scriptblock
            }
            catch {
                if ($attempts -ge $MaxAttempts) {
                    throw
                }
                else {
                    Write-DemoLog "Attempt $attempts failed. Retrying after $DelayInSeconds seconds. Error message: $_"
                    Start-Sleep -Seconds $DelayInSeconds

                    $attempts++
                }
            }
        } while ($true)
    }
}