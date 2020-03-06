#powershell.exe -command "& 'C:\Repositories\Udacity\udacity-redux\example.ps1'"


#Verifica sí el proceso ServerMultibrowser4 se encuentra en ejecución
$multiBrowserObject = Get-Process -Name "ServerMultibrowser4" -ErrorAction SilentlyContinue


#Sí el proceso no esta iniciado,entonces inicia proceso ServerMultibrowser4,sino , lo reinicia
if (!$multiBrowserObject) {
    $multiBrowserObject = Start-Process -FilePath "ServerMultibrowser4.exe" -WorkingDirectory "C:\autentia\Multibrowser4"
    Write-Host $multiBrowserObject.id
}
elseif ($multiBrowserObject) {
    
    Stop-Process -Id $multiBrowserObject.id
    Start-Sleep -s 1
    $multiBrowserObject = Start-Process -FilePath "ServerMultibrowser4.exe" -WorkingDirectory "C:\autentia\Multibrowser4"
    Write-Host $multiBrowserObject.id
}


