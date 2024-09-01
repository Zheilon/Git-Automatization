@echo off

set /p myDirectory=Direccion: 
cd %myDirectory%

dir

set /p fileName=Nombre de Archivo: 
set /p comment=Comentario: 

git add %fileName%
git commit -m "%comment%"

set /p confirm=Push? s / n: 

if "%confirm%" EQU "n" goto logs

for /f "tokens=*" %%i in ('git branch') do set b=%%i

cls
echo Current GitHub Branch: %b%
set /p branch=Ingresa Rama: 
git push origin %branch%
pause

cls
set /p pull=pull? s / n: 
if "%pull%" EQU "n" goto logs

echo Current GitHub Branch: %b%
set /p pullBranch=Ingresa Rama: 
git pull origin %pullBranch%
pause

cls

:logs
git log --oneline

pause

:salir
exit