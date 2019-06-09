# Office 365 Groups and Microsoft Teams PowerShell MasterClass

Demos by [atwork-it.com](https://www.atwork-it.com/).
Contributors: [Martina Grom](https://twitter.com/magrom), [Toni Pohl](https://twitter.com/atwork), [Christoph Wilfing](https://twitter.com/cwilfing)

Management of Office 365 and Microsoft Teams can be done in a lot of ways. The following scripts show essential PowerShell scripts you need to manage your Office 365 Groups and Microsoft Teams at scale. You must be a **Global Administrator in the Microsoft 365 tenant** to run all scripts. Use and adapt the scripts as required.

## Required PowerShell modules

You get the latest PowerShell modules from the PowerShell Gallery:

- [AzureADPreview](https://www.powershellgallery.com/packages/AzureADPreview/2.0.2.17)
- [MicrosoftTeams](https://www.powershellgallery.com/packages/MicrosoftTeams/1.0.0)
- Remote Exchange PowerShell (Microsoft.Exchange) - see the connect script

## Install the modules

Use the following commands to install the PowerShell modules in an environment (as Administrator) or for your current user with the command as here:

- Install-Module -Name MicrosoftTeams -Force -scope CurrentUser
- Install-Module -Name AzureADPreview -Force -scope CurrentUser
- Update-Module -Name AzureADPreview -Force

## Run the scripts anywhere

You can use the scripts on your computer with the required modules installed, or in Azure Automation Accounts or Azure Functions as well - in all environments, where Microsoft PowerShell is supported. To start with Azure Automation Accounts, check out [Create an Azure Automation account](https://docs.microsoft.com/en-us/azure/automation/automation-quickstart-create-account).

## Structure of the scripts

The scripts show demos how to manage  Office 365 Groups and Microsoft Teams in an Office 365 tenant. The scripts can be used as start for adapting your custom Office 365 tenant management. To make it easy to follow, the scripts are numbered by topic.

## Cross-Reference

- You can find a corresponding presentation at [SpeakerDeck.com - Office 365 Groups and Microsoft Teams PowerShell MasterClass (SPC19, BRK078)](https://speakerdeck.com/atwork/office-365-groups-and-microsoft-teams-powershell-masterclass-spc19-brk078)
- To see the open-source Groups Governance Toolkit from [atwork-it.com](https://www.atwork-it.com/), see https://github.com/martinagrom/Ignite2018GroupsGovernanceToolkit/) 
- If you are interested in a **ready-to-use Governance Overview solution** visualized with Power-BI, check out [governancetoolkit365.com](https://governancetoolkit365.com/). You can register for a free trial.

## For developers

Alternatively, developers can use the Microsoft Graph for accomplishing similar tasks. Check the group properties with Graph Explorer [aka.ms/ge](https://aka.ms/ge), similar like here:

- https://graph.microsoft.com/v1.0/groups?$filter=startswith(displayname,'my')
- See the channels, etc. https://graph.microsoft.com/v1.0/teams/[GroupID]/channels/
- Graph API has more actions, e.g. see the channels, e.g. see the tabs... https://graph.microsoft.com/v1.0/teams/[GroupID]/channels/[ChannelID]@thread.skype/tabs

Have a good Office 365 Groups and Teams management with these PowerShell scripts!
