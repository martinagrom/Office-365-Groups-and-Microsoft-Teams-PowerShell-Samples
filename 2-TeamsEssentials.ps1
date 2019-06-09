#------------------------------------------
# Teams Essentials
# See all available cmdlets at
# https://docs.microsoft.com/en-us/powershell/module/teams/connect-microsoftteams?view=teams-ps
#------------------------------------------

# Get a list of all teams
Get-Team

# Select one group we want to work with...
$group = '<A GROUP ID>'

# See all channels of that group
Get-TeamChannel -GroupId $group

# Create a new team channel in that group
New-TeamChannel -GroupId $group -DisplayName "My Las Vegas" -Description 'My Las Vegas'

# See some team member settings as AllowCreateUpdateChannels, AllowDeleteChannels, etc.
Get-Team -GroupId $group | fl

# Get all Team members
Get-TeamUser -GroupId $group

# Add a new user as member to that group
Add-TeamUser -GroupId $group -User nestorw@contoso.com
Add-TeamUser -GroupId $group -User alexw@contoso.com

# Modify that group (Alias is the nickname without domain)
Set-Team -GroupId $group -DisplayName 'My Las Vegas team' `
        -Visibility Private `
        -Classification confidential `
        -Description 'My Las Vegas' `
        -Alias 'LasVegas'

# See two group guest settings: AllowCreateUpdateChannels, AllowDeleteChannels
Get-TeamGuestSettings -GroupId $group | fl

# Set new Fun settings:
Get-TeamFunSettings -GroupId $group
Set-TeamFunSettings -GroupId $group -AllowGiphy true -GiphyContentRating Strict

#------------------------
# Channels
#------------------------

# Delete a channel:
Remove-TeamChannel -GroupId $group -DisplayName 'My Las Vegas'

# Note: -> The General channel cannot be removed: Message: General channel cannot be deleted.
Remove-TeamChannel -GroupId $group -DisplayName 'General'

# Check the existing channels
Get-TeamChannel -GroupId $group

#-----------------------------------------------
# Special use cases that currently don't work
#-----------------------------------------------

# -> User must be group owner, otherwise:
# Message: User does not have permissions to execute this action... Dragon.png
Set-TeamPicture -GroupId $group -ImagePath "C:\Temp\LasVegas.gif"

