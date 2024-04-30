function Write-DemoFunctionWithLoggingPwSh {
   [CmdletBinding()]
   param
   (
      [Parameter(Mandatory = $true)]
      [string] $Message
   )
   Write-Verbose 'Nice log statement to indicate that execution of this method has started...'
   Write-Verbose "- Message: $Message"

   Write-Verbose $Message
   Write-Host $Message

   Write-Verbose 'Nice log statement to indicate that execution of this method has finished...' 
}