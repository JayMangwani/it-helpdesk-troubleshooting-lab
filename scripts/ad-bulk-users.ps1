# Run on the Domain Controller as Domain Admin.
Import-Module ActiveDirectory
$domain = "DC=lab,DC=local"

# OUs
foreach ($ou in "Employees","Groups") {
    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$ou'")) {
        New-ADOrganizationalUnit -Name $ou -Path $domain
    }
}

# Security groups
foreach ($g in "GG-Finance","GG-HR","GG-IT") {
    if (-not (Get-ADGroup -Filter "Name -eq '$g'")) {
        New-ADGroup -Name $g -GroupScope Global -GroupCategory Security -Path "OU=Groups,$domain"
    }
}

# Users from CSV
$users = Import-Csv "$PSScriptRoot\users.csv"
foreach ($u in $users) {
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$($u.Sam)'")) {
        New-ADUser -Name "$($u.First) $($u.Last)" `
            -GivenName $u.First -Surname $u.Last `
            -SamAccountName $u.Sam -UserPrincipalName "$($u.Sam)@lab.local" `
            -Path "OU=Employees,$domain" `
            -AccountPassword (ConvertTo-SecureString "Welcome#2026!" -AsPlainText -Force) `
            -Enabled $true -ChangePasswordAtLogon $true
        Add-ADGroupMember -Identity $u.Group -Members $u.Sam
        Write-Host "Created $($u.Sam) in $($u.Group)"
    } else { Write-Host "$($u.Sam) already exists, skipped" }
}
