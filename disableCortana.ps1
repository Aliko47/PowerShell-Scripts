# Set the location to the registry
Set-Location -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows'

# Create a new Key
Get-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' | New-Item -Name 'Windows Search' -Force

# Create new items with values
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortana' -Value "0" -PropertyType DWord -Force

# Get out of the Registry
Pop-Location