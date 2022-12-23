$LicenseGroupName = "users-o365"
Connect-MgGraph -Scopes User.ReadWrite.All, Organization.Read.All,Directory.ReadWrite.All
$ExOPlan1 = Get-MgSubscribedSku | Where-Object {$_.SkuPartnumber -eq "EXCHANGESTANDARD"}

#Set UsageLocation for all users that have none
Get-MgUser -All | Where-Object { $_.UsageLocation -eq $null -and $_.UserType -eq 'Member' }  | ForEach-Object{Update-MgUser -UserId $_.UserPrincipalName -UsageLocation "DE" }
$licgroup = Get-MgGroup -Filter "Displayname eq $($LicenseGroupName)"

Get-MgGroupMember -GroupId $licgroup.Id -All| ForEach-Object{
    ((Get-MgUser -UserId $_.Id).UserPrincipalName)
    Set-MgUserLicense -UserId ((Get-MgUser -UserId $_.Id).UserPrincipalName) -AddLicenses @{SkuId = $ExOPlan1.SkuId} -RemoveLicenses @()
} 
