#--------------------------------------
# Transfer OwnerShip
#--------------------------------------
$UserOwnedGroups = @()

# Get the groups of which a user is an owner
$UserOwnedObjects = Get-AzureADUser -SearchString adelev | `
	Get-AzureADUserOwnedObject | Where-Object {$_.ObjectType -eq "Group"}

for($i=0; $i -lt $UserOwnedObjects.Count; $i++)
{
	$mbx = Get-UnifiedGroup $UserOwnedObjects[$i].ObjectId -ErrorAction SilentlyContinue
	if ( $null -ne $mbx )
	{
		$UserOwnedGroups += $mbx
	}
}

# Assign new owner to the groups
for($i=0; $i -lt $UserOwnedGroups.Count; $i++)
{
	Add-UnifiedGroupLinks $UserOwnedGroups.Alias -LinkType member -Links admin@sometenant.com
	Add-UnifiedGroupLinks $UserOwnedGroups.Alias -LinkType Owner -Links admin@sometenant.com
}
