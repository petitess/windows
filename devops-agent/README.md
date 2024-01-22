#### Download
```
https://vstsagentpackage.azureedge.net/agent/3.232.3/vsts-agent-win-x64-3.232.3.zip
```
#### Install
```
./config.cmd --unattended --url "https://dev.azure.com/XXX" --auth "PAT" --token "XXXx75plrkvy52xq" --pool "vmmgmtprod0x" --agent "vmmgmtprod01-1" --work "_work" --runAsService --runAsAutoLogon --noRestart --windowsLogonAccount "NT AUTHORITY\NETWORK SERVICE"
```
#### Remove
```
./config.cmd remove --auth "PAT" --token "XXXXsjqaej64k6txaskrxl37zujx75plrkvy52xq"
```
