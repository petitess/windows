#### Reolink Client App Blank Screen

##### Your Reolink client might open to a blank screen if you have a windows 11 computer with iris xe display drivers.

##### Navigate to `C:\Users\$env:username\AppData\Roaming\` and open `userSettings`:
```powershell
Start-Process C:\Users\$env:username\AppData\Roaming\reolink\userSettings
```
##### Find value: `{"key":"hardware-acceleration","type":"boolean","value":true,"_id":"`
##### And replace `true` with `false`:
```powershell
(Get-Content -path C:\Users\$env:username\AppData\Roaming\reolink\userSettings -Raw) `
 -replace '{"key":"hardware-acceleration","type":"boolean","value":true,"_id":"','{"key":"hardware-acceleration","type":"boolean","value":false,"_id":"'`
 | Set-Content -Path C:\Users\$env:username\AppData\Roaming\reolink\userSettings
 ```
