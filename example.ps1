#Ejecución script por acceso directo
#powershell.exe -command "& 'C:\Repositories\Udacity\udacity-redux\example.ps1'"

Set-ExecutionPolicy unrestricted

#Verifica sí el proceso ServerMultibrowser4 se encuentra en ejecución
$multiBrowserObject = Get-Process -Name "ServerMultibrowser4" -ErrorAction SilentlyContinue

#Verifica sí el proceso FPSensor se encuentra en ejecución
$fpSensorObject = Get-Process -Name "FPSensor" -ErrorAction SilentlyContinue




# #Sí el proceso no esta iniciado,entonces inicia proceso ServerMultibrowser4,sino , lo reinicia
if (!$multiBrowserObject) {
    $multiBrowserObject = Start-Process -FilePath "ServerMultibrowser4.exe" -WorkingDirectory "C:\autentia\Multibrowser4"
    Start-Sleep -s 1
   
}
if (!$fpSensorObject) {
    $fpSensorObject = Start-Process -FilePath "FPSensor.exe" -WorkingDirectory "C:\autentia\bin"
    Write-Host $multiBrowserObject.id
}

# Sì ambos servicios (FPSensor y Multibrowser) estan levantados, los detiene y los vuelve a levantar,
# hace un reinicio de de los servicios
elseif ($multiBrowserObject -and $fpSensorObject) {
    $multiBrowserObject = Get-Process -Name "ServerMultibrowser4" -ErrorAction SilentlyContinue
    $fpSensorObject = Get-Process -Name "FPSensor" -ErrorAction SilentlyContinue
    Stop-Process -Id $multiBrowserObject.id
    Start-Sleep -s 1
    Stop-Process -Id $fpSensorObject.id
    Start-Sleep -s 1
    $multiBrowserObject = Start-Process -FilePath "ServerMultibrowser4.exe" -WorkingDirectory "C:\autentia\Multibrowser4"
    Start-Sleep -s 1
    $fpSensorObject = Start-Process -FilePath "FPSensor.exe" -WorkingDirectory "C:\autentia\bin"
    Write-Host $multiBrowserObject.id
}


