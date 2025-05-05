# teams-channel-maker
Creates an arbitrary number of Team channels for Class groups.

To run the script, you will need to install connect-MicrosoftTeams from https://learn.microsoft.com/en-us/powershell/module/teams/connect-microsoftteams?view=teams-ps 

Then run 

Connect-MicrosoftTeams -TenantId xxxxx-xxxxxx-xxxxx-xxxxxx

You can get the TenantId by going into Teams, clicking on your Team in channels and choosing copy link. Take note also of the groupId for the next step.

It will prompt you to login from a browser. Once you are logged in, run 

SetupTeamsChannels.ps1

Enter the number of Team channels you want to create when prompted. You will also need the tenantId and GroupId from the link you copied earlier. 

Note: channels will be named Team ## 