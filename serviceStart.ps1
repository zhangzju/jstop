$command = 'Restart-Service -Name VMAuthdService'
Start-Process -FilePath powershell.exe -ArgumentList "-noprofile -command $Command" `
-Verb runas
 