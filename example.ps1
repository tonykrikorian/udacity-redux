#powershell.exe -command "& 'C:\Repositories\Udacity\udacity-redux\example.ps1'"


#Verifica sí el proceso ServerMultibrowser4 se encuentra en ejecución
$multiBrowserObject = Get-Process -Name "ServerMultibrowser4" -ErrorAction SilentlyContinue
$fpSensorObject = Get-Process -Name "FPSensor" -ErrorAction SilentlyContinue




# #Sí el proceso no esta iniciado,entonces inicia proceso ServerMultibrowser4,sino , lo reinicia
if (!$multiBrowserObject -or !$fpSensorObject) {
    $multiBrowserObject = Start-Process -FilePath "ServerMultibrowser4.exe" -WorkingDirectory "C:\autentia\Multibrowser4"
    Start-Sleep -s 3
    $fpSensorObject = Start-Process -FilePath "FPSensor.exe" -WorkingDirectory "C:\autentia\bin"
    Write-Host $multiBrowserObject.id
}
# elseif ($multiBrowserObject -and $fpSensorObject) {
#     $multiBrowserObject = Get-Process -Name "ServerMultibrowser4" -ErrorAction SilentlyContinue
#     $fpSensorObject = Get-Process -Name "FPSensor" -ErrorAction SilentlyContinue
#     Stop-Process -Id $multiBrowserObject.id
#     Start-Sleep -s 2
#     Stop-Process -Id $fpSensorObject.id
#     Start-Sleep -s 2
#     $multiBrowserObject = Start-Process -FilePath "ServerMultibrowser4.exe" -WorkingDirectory "C:\autentia\Multibrowser4"
#     Start-Sleep -s 2
#     $fpSensorObject = Start-Process -FilePath "FPSensor.exe" -WorkingDirectory "C:\autentia\bin"
#     Write-Host $multiBrowserObject.id
# }


