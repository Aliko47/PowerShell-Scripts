#Load AD Module, if RSAT is installed
#Get-Module ActiveDirectory

#Or you can use this one
Try{
    #Load AD Module
    $DC = New-PSSession -ComputerName DC
    Import-Module -PSsession $DC -Name ActiveDirectory
}
Catch{
    #AD Module failed
    Write-Host "Loading AD Module failed!" -ForegroundColor Red
    $PSitem 
    break
}

do {

    #Get User sAMAccountName
    $user = Read-Host -Prompt 'Input AD-Username'
    $newPassword = Read-Host -Prompt 'Input new password' -AsSecureString
    $ReTypeNewPassword = Read-Host -Prompt 'Retype new password' -AsSecureString
    #Encrypt password for comparing
    $newPassword_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($newPassword))
    $ReTypeNewPassword_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($ReTypeNewPassword))

    #Compare password if match
    if($newPassword_text -ne $ReTypeNewPassword_text){
        Write-Host "Password does not match! Please retype" -ForegroundColor Red
    }
    else {
        $newPassword = ConvertTo-SecureString $newPassword -AsPlainText -Force
    }

}while($newPassword_text -ne $ReTypeNewPassword_text)


Try{
    #Proceed PW Change at AD
    Set-ADAccountPassword -Identity $user -NewPassword $newPassword -Reset
    Write-Host "Password changed!" -ForegroundColor Green
}
Catch{
    #Changing password failed
    Write-Host "An error occurred" -ForegroundColor Red
    $PSitem 
    break
}
