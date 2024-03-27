$AgentUrl = 'https://vstsagentpackage.azureedge.net/agent/3.236.1/vsts-agent-win-x64-3.236.1.zip'
$PAT = "xxf5seh5vutzt27j2hsosvq"
$OrgNAme = "xxse"
$PoolName = "vmdevopslabb01"
$AgentName = "agent_$(Get-Date -Format "yyMMdd")"

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
        --agent "$($AgentName)_$($_)" `
        --work "D:\_work_$($AgentName)_$($_)" `
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
