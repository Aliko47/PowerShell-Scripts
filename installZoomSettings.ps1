if (Test-Path -Path registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ZoomUMX\PerInstall) {

    # Create new items with values
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'autostart' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'enableupdate' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'NoGoogle' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'NoFacebook' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'NoSSO' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'ZoomAutoStart' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'AutoUpdate' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'EnableSilentAutoUpdate' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'KeepSignedIn' -Value "true" -PropertyType String -Force

    # Get out of the Registry
    Pop-Location 
}
else {

    # Set the location to the registry
    Set-Location -Path 'HKLM:\SOFTWARE\WOW6432NODE'

    # Create a new Key
    Get-Item -Path 'HKLM:\SOFTWARE\WOW6432NODE' | New-Item -Name 'ZoomUMX\PerInstall' -Force

    # Create new items with values
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'autostart' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'enableupdate' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'NoGoogle' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'NoFacebook' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'NoSSO' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'ZoomAutoStart' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'AutoUpdate' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'EnableSilentAutoUpdate' -Value "true" -PropertyType String -Force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432NODE\ZoomUMX\PerInstall' -Name 'KeepSignedIn' -Value "true" -PropertyType String -Force

    # Get out of the Registry
    Pop-Location

}