. $PSScriptRoot/Default.ps1

# function Wrapper {
#    [CmdletBinding()]
#    param (
#       [Parameter()]
#       [scriptblock]
#       $ScriptBlock
#    )

#    Write-DemoLog -Message 'Begin of the script block'
#    Invoke-Command -ScriptBlock $ScriptBlock
#    Write-DemoLog -Message 'End of the script block'
# }

# Wrapper -ScriptBlock {
Write-DemoLog -Message 'Hello, world!' -Warning
# }