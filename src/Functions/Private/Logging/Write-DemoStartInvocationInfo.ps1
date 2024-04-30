function Write-DemoStartInvocationInfo {
   [CmdletBinding()]
   param (
      [Parameter(Mandatory = $true)]
      [System.Management.Automation.InvocationInfo] $InvocationInfo
   )

   Write-DemoLog -Message "> $($InvocationInfo.InvocationName)" -Trace

   $parametersDictionary = Get-DemoParameterValuesIncludingDefaultValues($InvocationInfo)
   foreach ($parameter in $parametersDictionary.GetEnumerator()) {
      $parameterValue = $parameter.Value

      if (($null -ne $parameterValue) -and ($parameterValue.GetType() -eq [ScriptBlock])) {
         $expandString = $ExecutionContext.InvokeCommand.ExpandString($parameterValue)
         Write-DemoLog -Message ">`t-$($parameter.Key) `n{$expandString`n}" -Trace
      }
      else {
         Write-DemoLog -Message ">`t-$($parameter.Key) $($parameterValue)" -Trace
      }
   }
}