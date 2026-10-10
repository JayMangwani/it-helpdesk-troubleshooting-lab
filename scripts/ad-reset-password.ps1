param([Parameter(Mandatory)][string]$User)
# Verify identity per policy BEFORE running this.
$temp = -join ((48..57)+(65..90)+(97..122) | Get-Random -Count 14 | ForEach-Object {[char]$_})
Set-ADAccountPassword -Identity $User -Reset -NewPassword (ConvertTo-SecureString $temp -AsPlainText -Force)
Set-ADUser -Identity $User -ChangePasswordAtLogon $true
Unlock-ADAccount -Identity $User
Write-Host "Temporary password for ${User}: $temp  (share via secure channel only)"
