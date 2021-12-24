#Load AD Module
Get-Module ActiveDirectory

#Promp user to type in sAMAccountName
$user = Read-Host -Prompt 'Input AD-Username'
$newPassword = Read-Host -Prompt 'Input new password'
$newPassword = ConvertTo-SecureString $newPassword -AsPlainText -Force

$logonChangePW = Read-Host 'Change password at next logon (Y/N)?'

#Proceed PW Change at AD
Set-ADAccountPassword -Identity $user -NewPassword $newPassword -Reset

#Change password at next logon?
if ($logonChangePW -eq 'y'-or $logonChangePW -eq 'Y' -or $logonChangePW -eq '') {
    Set-ADUser -Identity $user -ChangePasswordAtLogon $true
} 

Write-Host "Password changed!"
