#--------------------------------------
# Hide specific Group from Outlook
#--------------------------------------
$Groups = Get-UnifiedGroup -ResultSize Unlimited | ? {$_.Name -like "Section_*"}
Foreach ($g in $Groups) { 
        Set-UnifiedGroup $g.Guid -HiddenFromAddressListsEnabled $true
        Write-Host "HiddenFromAddressListsEnabled was updated: $($g.DisplayName)"
}
Write-Host "$($Groups.count) groups"


#--------------------------------------
# Hide a specific group
#--------------------------------------
$id = "Project Tango"
Set-UnifiedGroup -Identity $id -HiddenFromExchangeClientsEnabled:$True
