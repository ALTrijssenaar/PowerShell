# Setting: search for [terminal temp], enable this

# 1	Success Stream	               Write-Output
# 2	Error Stream	               Write-Error
# 3	Warning Stream	               Write-Warning
# 4	Verbose Stream	               Write-Verbose
# 5	Debug Stream	               Write-Debug
# 6	Information Stream	         Write-Information, Write-Host
# *	All Streams	PowerShell 3.0	

function Show-Streams {
   # [CmdletBinding()]
   # param()
   Write-Output 'Write-Output 1: This is a message from Write-Output.'
   # Write-Error 'Write-Error 2: This is a message from Write-Error.'
   Write-Warning 'Write-Warning 3: This is a message from Write-Warning.'
   Write-Verbose 'Write-Verbose 4: This is a message from Write-Verbose.'
   Write-Debug 'Write-Debug 5: This is a message from Write-Debug.'
   Write-Information 'Write-Information 5: This is a message from Write-Information.'
   Write-Host 'Write-Host 6: This is a message from Write-Host.'
}

Show-Streams
# Show-Streams -Verbose -Debug

# $DebugPreference = 'Continue'
# $VerbosePreference = 'Continue'
# Show-Streams

# $a = Show-Streams
# $a = (Show-Streams *>&1)
