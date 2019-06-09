#------------------------------------------
# Groups Essentials
#------------------------------------------

#--------------------------------------
# List all groups in descending order
#--------------------------------------
Get-UnifiedGroup | Select Id, DisplayName, ManagedBy, Alias, AccessType, `
WhenCreated, @{Expression={([array](Get-UnifiedGroupLinks -Identity $_.Id -LinkType `
    Members)).Count }; Label='Members'} | Sort-Object whencreated | `
    Format-Table displayname, alias, managedby, Members, accesstype, whencreated

#--------------------------------------
# List all private groups
#--------------------------------------
Get-UnifiedGroup | Where-Object {$_.AccessType -eq 'Private'} | `
    Sort-Object whencreated | Format-Table displayname, alias, `
    managedby, accesstype, whencreated


