Connect-Graph -Scopes User.ReadWrite.All, Organization.Read.All,Directory.ReadWrite.All
$ExOPlan1 = Get-MgSubscribedSku | where SkuPartnumber -eq "EXCHANGESTANDARD"

#Set UsageLocation for all users that have none
Get-MgUser -All | where { $_.UsageLocation -eq $null -and $_.UserType -eq 'Member' }  | %{Update-MgUser -UserId $_.UserPrincipalName -UsageLocation "DE" }
$licgroup = Get-MgGroup -Filter "Displayname eq 'sec-o365'"

Get-MgGroupMember -GroupId $licgroup.Id -All| %{((Get-MgUser -UserId $_.Id).UserPrincipalName); Set-MgUserLicense -UserId ((Get-MgUser -UserId $_.Id).UserPrincipalName) -AddLicenses @{SkuId = $ExOPlan1.SkuId} -RemoveLicenses @()} 
