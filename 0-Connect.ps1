#------------------------------------------
# Office 365 Groups and Microsoft Teams PowerShell MasterClass
# Teams PS and AD Module demos by
# atwork.at, Martina Grom @magrom, Toni Pohl @atwork, Christoph Wilfing @cwilfing
#------------------------------------------

# First install the modules...
# Install-Module -Name MicrosoftTeams -Force -scope CurrentUser
# Install-Module -Name AzureADPreview -Force -scope CurrentUser
# Update-Module -Name AzureADPreview -Force

# Import the modules...
Import-Module MicrosoftTeams
Import-Module AzureADPreview

# Then, connect...
$cred = Get-Credential
$cred.password.MakeReadOnly()

# Connect to the Teams module
Connect-MicrosoftTeams -Credential $cred

# If required, connect to the AAD module
# $cred should still have a password
Connect-AzureAD -Credential $cred

$session = New-PSSession -ConfigurationName Microsoft.Exchange `
    -ConnectionUri https://ps.outlook.com/powershell/ `
    -Credential $cred -Authentication Basic -AllowRedirection
Import-PSSession $Session -AllowClobber
Write-Output "ready for Exchange Online!"

# If no longer used, remove th EXO session...
# Remove-PSSession $Session 
