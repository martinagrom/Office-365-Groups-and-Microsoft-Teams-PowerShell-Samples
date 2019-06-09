#------------------------------------------
# Soft Delete
#------------------------------------------

# Get all the Groups
Get-AzureADGroup 

# Soft Delete a specific group
$ToDelete = "<A GROUP ID>"
Remove-AzureADGroup -ObjectId $ToDelete 

# Show all Soft Deleted Groups in descending order
Get-AzureADMSDeletedGroup | Sort-Object DeletedDateTime -Descending | `
    Format-Table Id, DisplayName, Description, Visibility, DeletedDateTime

# Restore a specific soft deleted group
Restore-AzureADMSDeletedDirectoryObject -Id $ToDelete 

# Hard Delete a Group
Remove-AzureADMSDeletedDirectoryObject -Id $ToDelete
