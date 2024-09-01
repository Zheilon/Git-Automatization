@echo off

set /p myDirectory=Direccion: 
cd %myDirectory%

dir

set /p fileName=Nombre de Archivo: 
set /p comment=Comentario: 

git add %fileName%
git commit -m "%comment%"

set /p confirm=Push? s / n: 

if "%confirm%" EQU "n" goto pulling

for /f "tokens=*" %%i in ('git branch') do set b=%%i

cls
echo Current Git Branch: %b%
set /p branch=Ingresa Rama: 
git push origin %branch%
pause

:pulling
cls
set /p pull=pull? s / n: 
if "%pull%" EQU "n" goto logs
for /f "tokens=*" %%i in ('git branch -r') do set bG=%%i
echo Current GitHub Branch: %bG%
set /p pullBranch=Ingresa Rama: 
git pull origin %pullBranch%
pause

cls

:logs
git log --oneline

pause

:salir
exit