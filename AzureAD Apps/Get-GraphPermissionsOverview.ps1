# inspired by Fabian Sasse:
# https://gist.github.com/Fabaderheld/547a50406205473675512aad2e5736ff
#
# Microsoft Graph permissions reference:
# https://docs.microsoft.com/en-us/graph/permissions-reference 

Connect-AzAccount # and provide administrative login credentials
# run as app
(Get-AzAdServicePrincipal -ApplicationId 00000003-0000-0000-c000-000000000000).Oauth2PermissionScope | select origin,value
# run as user
(Get-AzAdServicePrincipal -ApplicationId 00000003-0000-0000-c000-000000000000).AppRole | select origin,value

