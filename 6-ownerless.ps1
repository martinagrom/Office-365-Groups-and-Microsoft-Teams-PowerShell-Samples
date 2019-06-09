#------------------------------------------
# Ownerless Groups
#------------------------------------------

# Get Ownerless groups, if less than 2 owners
$OwnerlessGroups = [array](Get-UnifiedGroup | `
    Where-Object {([array](Get-UnifiedGroupLinks -Identity $_.Id -LinkType Owners)).Count -lt 2}) | `
    Select Id, DisplayName, ManagedBy, WhenCreated, SMTPAddress 

Write-Output "Ownerless groups: $($OwnerlessGroups.Count)"

# Assign owner to the ownerless group
for ($i=0; $i -lt $OwnerlessGroups.Count; $i++)
{
    Add-UnifiedGroupLinks $OwnerlessGroups.Alias -LinkType member -Links admin@contoso.com
    Add-UnifiedGroupLinks $OwnerlessGroups.Alias -LinkType Owner  -Links admin@contoso.com
}

# Modify owner of an existing group
$group = "Project Phoenix"
Add-UnifiedGroupLinks $group -LinkType Owner -Links adelev@contoso.com

# Remove user
$id = "<A GROUP ID>"
Remove-TeamUser -GroupId $id -User nestorw@contoso.com
