write-host "Closing steam";
try{
    $steamId = (Get-Process "Steam").Id;
    stop-process $steamId;
    Wait-Process $steamId;
}catch
{
    write-host "Steam is not open";
}

write-host "Fixing Steam vac service";

start-process 'C:\Program Files (x86)\Steam\bin\steamservice.exe' {'/repair'};
$fixId = (get-process "steamservice").Id;
wait-process $fixId;
