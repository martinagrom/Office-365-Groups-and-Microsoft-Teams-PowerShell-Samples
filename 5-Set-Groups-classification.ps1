#-------------------------------------------
# Setup-Group-Classification.ps1
# https://github.com/martinagrom/Ignite2018GroupsGovernanceToolkit/blob/master/Setup-Group-Classification.ps1 
#-------------------------------------------
# Setting the Office 365 Groups classification at directory level. See also
# https://docs.microsoft.com/en-us/azure/active-directory/active-directory-accessmanagement-groups-settings-cmdlets
# September 2018, atwork.at. Script by Christoph Wilfing, Martina Grom, Toni Pohl

# Create the template
$Template = Get-AzureADDirectorySettingTemplate -Id <ID>

$Setting = $template.CreateDirectorySetting()
$setting["UsageGuidelinesUrl"] = "http://atwork-it.com"
$setting["ClassificationList"] = "public, internal, confidential, strictly confidential"
$setting["ClassificationDescriptions"] = "public:no restrictions,internal:all internal users can access,confidential:only special users can access,strictly confidential:only selected users can access"
$setting["GuestUsageGuidelinesUrl"] = "http://atwork-it.com"
$setting["CustomBlockedWordsList"] = "boss,ceo,CFO,giggles"

# Get directory settings if they exist (the result is empty if no directory settings are created)
$DirSettings = Get-AzureADDirectorySetting

if ($Null -eq $DirSettings) {
    # There are no directory settings, creating new ones
    New-AzureADDirectorySetting -DirectorySetting $Setting 
} else {
    # Set values as desired
    Set-AzureADDirectorySetting –Id $DirSettings.Id -DirectorySetting $setting
}

# If you want to delete all existing settings, just delete them
Remove-AzureADDirectorySetting -Id (Get-AzureADDirectorySetting).id

# Show all directory settings
Get-AzureADDirectorySetting -All $True | Select-Object -ExpandProperty values

# Check it and done.