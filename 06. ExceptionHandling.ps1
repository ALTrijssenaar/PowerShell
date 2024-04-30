. $PSScriptRoot/Default.ps1

class DemoException : ApplicationException {
   DemoException([string] $Message):base ($Message) {}
}

function ThrowDemoException {
   throw [DemoException]::new('This is a demo exception.')
}

function ThrowDemoExceptionWrapper{
   ThrowDemoException
}

function ThrowException {
   1 /0
}

function ThrowExceptionWrapper {
   ThrowException
}

try {
   ThrowExceptionWrapper
   # ThrowDemoExceptionWrapper
}
catch [DemoException] {
   Write-Host -ForegroundColor Red -Object $_.Exception.Message
}
catch {
   throw
}
finally {
   Write-Host -Object 'Finally block executed.'
}

