#Path
$Path = Split-Path -Parent "C:\Scripts\*.*"

#Check if path exist
If(!(test-path $Path))
{
      New-Item -ItemType Directory -Force -Path $Path
}

#Create variable for the date stamp
$timeStamp = Get-Date -f yyyy-MM-dd-hh-mm

#Define CSV
$CSVfile = $Path + "\ADUsers_$timeStamp.csv"

#Import Active Directory module
Import-Module ActiveDirectory

#Set distinguishedName as Array-List
$DNs = New-Object System.Collections.Generic.List[System.Object]

do {

    $distinguishedName = Read-Host -Prompt 'Input distinguishedName'
    $DNs.Add($distinguishedName)
    $continue = Read-Host -Prompt 'Do you want to put more distinguishedNames (Y/N)?'

} while ($continue -eq 'Y' -or $continue -eq 'y' -or $continue -eq '')


#Create empty array
$AllADUsers = @()

Write-Host 'Connecting to AD...'

#Loop thru every DN
foreach ($DN in $DNs) {
    $Users = Get-ADUser -SearchBase $DN -Filter * -Properties * 

    #Add users to array
    $AllADUsers += $Users
}

#Create list
$AllADUsers | Sort-Object Name | Select-Object `
@{Label = "First name"; Expression = { $_.GivenName } },
@{Label = "Last name"; Expression = { $_.Surname } },
@{Label = "User logon name"; Expression = { $_.SamAccountName } },
@{Label = "User principal name"; Expression = { $_.UserPrincipalName } },
@{Label = "Country/region"; Expression = { $_.Country } },
@{Label = "Job Title"; Expression = { $_.Title } },
@{Label = "Telephone number"; Expression = { $_.telephoneNumber } },
@{Label = "E-mail"; Expression = { $_.Mail } },
@{Label = "Account status"; Expression = { if (($_.Enabled -eq 'TRUE') ) { 'Enabled' } Else { 'Disabled' } } },
@{Label = "Last logon date"; Expression = { $_.lastlogondate } }|

#Export to CSV file
Export-Csv -Encoding UTF8 -Path $CSVfile -NoTypeInformation #-Delimiter ";"

Write-Host 'Done!'
Write-Host 'CSV File saved at' $Path