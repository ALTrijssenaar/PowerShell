function Write-DemoEndInvocationInfo {
   [CmdletBinding()]
   param (
      [Parameter(Mandatory = $true)]
      [System.Management.Automation.InvocationInfo] $InvocationInfo,

      [Parameter(Mandatory = $false)]
      [System.Diagnostics.Stopwatch] $Stopwatch
   )

   $message = "> /$($InvocationInfo.InvocationName)"
   if ($Stopwatch) { $message += ", duration $($Stopwatch.Elapsed.ToString("hh\:mm\:ss\.fff"))" }
   Write-DemoLog -Message $message -Trace
}