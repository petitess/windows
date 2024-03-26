$AgentUrl = 'https://vstsagentpackage.azureedge.net/agent/3.236.1/vsts-agent-win-x64-3.236.1.zip'
$PAT = "xxxxeks4xf5seh5vutzt27j2hsosvq"
$OrgNAme = "xxse"
$PoolName = "vmdevopslabb01"

Invoke-WebRequest -URI $AgentUrl -OutFile "agent.zip"
#Install
1..2 | ForEach-Object {
    New-Item -ItemType Directory -Name "agent$($_)"
    Set-Location -Path "agent$($_)"
    Expand-Archive -Path "..\agent.zip" -DestinationPath "..\agent$($_)"
    ./config.cmd --unattended `
        --url "https://dev.azure.com/$OrgNAme" `
        --auth "PAT" --token $PAT  `
        --pool $PoolName `
        --agent "agent$($_)" `
        --work "D:\_work_agent$($_)" `
        --runAsService `
        --runAsAutoLogon `
        --noRestart `
        --windowsLogonAccount "NT AUTHORITY\NETWORK SERVICE"
    Set-Location -Path ".."
}


#Uninstall
$Folders = Get-ChildItem -Directory | Where-Object { $_.Name -like "agent*" }
$Folders | ForEach-Object {
    Set-Location -Path $_
    ./config.cmd remove --auth "PAT" --token $PAT
    Set-Location -Path ".."
}
