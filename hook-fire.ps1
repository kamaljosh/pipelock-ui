$raw = [Console]::In.ReadToEnd()
$start = $raw.IndexOf('{')
if ($start -gt 0) { $raw = $raw.Substring($start) }

$pipelock = "C:\Users\kamal\Downloads\pipelock-main\pipelock-main\pipelock.exe"
$config   = "$env:APPDATA\pipelock\pipelock.yaml"
$logFile  = "$env:USERPROFILE\.cursor\cursor-hook-events.log"
$tmpIn    = "$env:TEMP\cursor_hook_input.json"

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($tmpIn, $raw, $utf8NoBom)

$output = Get-Content $tmpIn -Raw | & $pipelock cursor hook --config $config 2>&1

"==== CURSOR EVENT ====" | Add-Content $logFile
"TIME: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" | Add-Content $logFile
"INPUT:" | Add-Content $logFile
$raw | Add-Content $logFile
"OUTPUT:" | Add-Content $logFile
$output | Add-Content $logFile
"" | Add-Content $logFile

Write-Output $output