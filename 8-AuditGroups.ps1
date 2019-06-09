#--------------------------------------
# Retrieve all groups where classification is blank or null
#--------------------------------------
$GroupsWithNoClassification = Get-UnifiedGroup | Where-Object {$_.Classification -Eq $Null -or $_.Classification -Eq ""} | Sort-Object DisplayName | Select DisplayName, Classification, ExternalDirectoryObjectId

#--------------------------------------
# Set the classification of each group to "internal" 
#--------------------------------------
ForEach ($g in $GroupsWithNoClassification) {
    If ($Null -eq $g.Classification -or $g.Classification -eq "") {
        Set-UnifiedGroup -Identity $G.DisplayName -Classification "internal"
        Write-Host "The group classification setting for $($G.DisplayName) was updated to internal."
    }
}
Write-Host "$($GroupsWithNoClassification.count) groups"


#--------------------------------------
# Identify which groups have a mismatch of properties
#--------------------------------------
$GroupsWithClassificationMismatch = Get-UnifiedGroup | `
    Where-Object {$_.AccessType -eq "Public" -and $_.Classification -eq "High"} | `
    Select DisplayName, Classification, AccessType, ExternalDirectoryObjectId

#--------------------------------------
# Set the Access Type to Private for all "High" groups
#--------------------------------------
ForEach ($g in $GroupsWithClassificationMismatch) {
    Set-UnifiedGroup -Identity $g.DisplayName -AccessType "Private"
    Write-Host "The following Group privacy setting was updated: $($g.DisplayName)"
}
Write-Host "$($GroupsWithClassificationMismatch.count) groups"

