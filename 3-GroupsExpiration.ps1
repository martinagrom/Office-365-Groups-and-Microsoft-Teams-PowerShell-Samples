#------------------------------------------
# Groups Expiration
#------------------------------------------

# Gets current setting
Get-AzureADMSGroupLifecyclePolicy | Format-List

$LifetimeID = <ID>

# Removes current policy
Remove-AzureADMSGroupLifecyclePolicy -Id $LifetimeID

# Setup of new Groups Lifecycle policy (None, All, Selected)
New-AzureADMSGroupLifecyclePolicy -GroupLifetimeInDays 35 -ManagedGroupTypes "All" `
    -AlternateNotificationEmails admin@contoso.com

# Update of a policy
Set-AzureADMSGroupLifecyclePolicy -Id $LifetimeID -GroupLifetimeInDays 40 `
    -AlternateNotificationEmails admin@contoso.com -ManagedGroupTypes "All"

# Retrieves Lifecyclepolicy of a selected group
Get-UnifiedGroup | Select id, displayname

$group = "<A GROUP ID>"
Get-AzureADMSLifecyclePolicyGroup  -Id $group

# Renews a group by updating the RenewedDateTime property on a group to the current DateTime.
Reset-AzureADMSLifeCycleGroup -GroupId $group 

# Adds a group to a lifecycle policy
Add-AzureADMSLifecyclePolicyGroup -Id $LifetimeID -GroupId $group
