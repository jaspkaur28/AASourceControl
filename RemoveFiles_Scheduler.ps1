$action = New-ScheduledTaskAction -Execute 'forfiles.exe' -argument '-p "C:\inetpub\logs" -m *.log* /D -30 /C "cmd /r del @path /s"'
$settings = New-ScheduledTaskSettingsSet -MultipleInstances Parallel
$trigger =  New-ScheduledTaskTrigger -Daily -At 4am
$Principal = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel "Highest"
Register-ScheduledTask -Action $action -Trigger $trigger -Principal $Principal -TaskName "Clear IIS Logs" -Description "Clear IIS Logs older than 30 Days"