# See https://learn.microsoft.com/en-us/powershell/module/teams/new-teamchannel?view=teams-ps
# and https://learn.microsoft.com/en-us/powershell/module/teams/connect-microsoftteams?view=teams-ps
# For Mac see https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-macos?view=powershell-7.4

# Prompt for the Teams GroupId which can be found in the link URL to the Team
$TenantId = Read-Host "Please enter the TenantId"
$GroupId = Read-Host "Please enter the GroupId"

# Function to validate TotalChannels input
function Get-ValidatedTotalChannels {
    while ($true) {
        $TotalChannels = Read-Host "How many channels do you wish to create"
        if ($TotalChannels -match '^\d+$' -and [int]$TotalChannels -gt 0 -and [int]$TotalChannels -lt 30) {
            return [int]$TotalChannels
        } else {
            Write-Host "Please enter a valid positive integer less than 30."
        }
    }
}

$TotalChannels = Get-ValidatedTotalChannels

# Login
Connect-MicrosoftTeams -TenantId $TenantId

for ($i = 1; $i -le $TotalChannels; $i++) {
    Write-Host "Creating channel $i"
    New-TeamChannel -GroupId $GroupId -DisplayName "Team $i"
}
