$hostname = Hostname
$token = ""

$all_hosts = @("hostnames")

$all_tokens = @("tokens")

for ($i=0; $i -lt $all_hosts.length; $i++){
    
    if ($hostname -contains $all_hosts[$i]  ) {
        $token = $all_tokens[$i]
        Write-Host $token
    }
}

$MyFileName = "CsUninstallTool.exe"
$filebase = Join-Path $PSScriptRoot $MyFileName

Write-Host $filebase

$arguments = "MAINTENANCE_TOKEN=" + $token + " /quiet"

Start-Process -Wait -FilePath $filebase -ArgumentList $arguments -PassThru

Invoke-Expression "& `"$filebase`" `"$arguments`""

$success = Join-Path $PSScriptRoot "cs_success.txt"

Copy-Item  $success -Destination "C:\"