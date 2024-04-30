function Write-DemoLog {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, Position = 0)]
        [string] $Message, # Allow for positional parameter

        [Parameter(Mandatory = $false, ParameterSetName = 'LevelByName')]
        [ValidateSet('FATAL', 'ERROR', 'WARNING', 'INFO', 'TRACE')]
        [string] $Level = 'INFO',
        [Parameter(Mandatory = $true, ParameterSetName = 'FatalLevel')]
        [switch] $Fatal,
        [Parameter(Mandatory = $true, ParameterSetName = 'ErrorLevel')]
        [switch] $Error,
        [Parameter(Mandatory = $true, ParameterSetName = 'WarningLevel')]
        [switch] $Warning,
        [Parameter(Mandatory = $true, ParameterSetName = 'InfoLevel')]
        [switch] $Info,
        [Parameter(Mandatory = $true, ParameterSetName = 'Trace')]
        [switch] $Trace,

        [switch] $Highlight
    )

    if ($VerbosePreference -eq 'Ignore') {
        return
    }

    #region Level

    if ($Fatal.IsPresent) {
        $Level = 'FATAL'
    }
    elseif ($Error.IsPresent) {
        $Level = 'ERROR'
    }
    elseif ($Warning.IsPresent) {
        $Level = 'WARNING'
    }
    elseif ($Info.IsPresent) {
        $Level = 'INFO'
    }
    elseif ($Trace.IsPresent) {
        $Level = 'TRACE'
    }
    else {
        $Level = $Level.ToUpperInvariant()
    }

    #endregion

    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss.fff'
    $hostname = [System.Net.Dns]::GetHostName()
    $formattedMessage = "$timestamp - $($hostname.PadRight(16)) - $($Level.PadRight(8)) - $Message"

    if ($Highlight -and $Level -in 'INFO', 'TRACE') {
        switch ($Level) {
            'INFO' { Write-Host $formattedMessage -ForegroundColor Yellow -ErrorAction SilentlyContinue }
            'TRACE' { if ($VerbosePreference -ne "SilentlyContinue") { Write-Host $formattedMessage -ForegroundColor Magenta -ErrorAction SilentlyContinue } }
        }
    }
    else {
        switch ($Level) {
            'FATAL' { Write-Host $formattedMessage -ForegroundColor White -BackgroundColor Red -ErrorAction SilentlyContinue }
            'ERROR' { Write-Host $formattedMessage -ForegroundColor Red -ErrorAction SilentlyContinue }
            'WARNING' { Write-Host $formattedMessage -ForegroundColor DarkYellow -ErrorAction SilentlyContinue }
            'INFO' { Write-Host $formattedMessage -ForegroundColor White -ErrorAction SilentlyContinue }
            'TRACE' { if ($VerbosePreference -ne "SilentlyContinue") { Write-Host $formattedMessage -ForegroundColor Cyan -ErrorAction SilentlyContinue } }
        }
    }
}