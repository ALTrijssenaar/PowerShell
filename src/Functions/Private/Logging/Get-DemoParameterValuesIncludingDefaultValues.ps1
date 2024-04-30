function Get-DemoParameterValuesIncludingDefaultValues {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.InvocationInfo] $InvocationInfo
    )

    $parameterValues = @{}
    foreach ($parameter in $InvocationInfo.MyCommand.Parameters.GetEnumerator()) {
        $key = $parameter.Key

        $defaultParameters = @("ErrorAction", "OutVariable", "WarningAction", "WarningVariable", "Debug", "OutBuffer", "InformationAction", "ErrorVariable", "InformationVariable", "PipelineVariable", "Verbose")
        if ($defaultParameters -contains $key) {
            continue
        }

        if ($null -ne ($value = Get-Variable -Name $key -ValueOnly -ErrorAction Ignore)) {
            if ($value -ne ($null -as $parameter.Value.ParameterType)) {
                $parameterValues[$key] = $value
            }
        }
        if ($InvocationInfo.BoundParameters.ContainsKey($key)) {
            $parameterValues[$key] = $InvocationInfo.BoundParameters[$key]
        }
    }

    return $parameterValues
}