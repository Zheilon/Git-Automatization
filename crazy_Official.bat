:: By Zheilon
@echo off

:present
cls
echo ---+------------------------------------+---
echo ---#        *- Git Commands -*          #---
echo ---+------------------------------------+---
echo ---# (1.) add - commit - push           #---
echo ---+ (2.) Vincualar Git con GitHub      +---
echo ---# (3.) git push                      #---
echo ---+ (4.) git pull                      +---
echo ---# (5.) Numero de Ramas - GitHub      #---
echo ---+ (6.) Mostrar Commits               +---
echo ---+------------------------------------+---

set /p option=Selecciona Opcion: 

if %option% EQU 1 goto starting_1
if %option% EQU 2 goto link_2
if %option% EQU 3 goto simplePush_3

:starting_1
cls
set /p adress=Ingresa Direccion: 
cd %adress%
dir

set /p fileName=Nombre: 
git add %fileName%

set /p comment=Comentario: 
git commit -m "%comment%"

pause
goto present

:link_2
cls
echo --- Vincualar Git - GitHub ---
echo ------------------------------

set /p remoteAdress=Github Link: 
git remote add origin %remoteAdress%

set /p createBranch=Nombre de la nueva rama: 
git branch -M %createBranch%

echo git push...
git push -u origin %createBranch%

pause
goto present

:simplePush_3
cls
echo ---         push           ---
echo ------------------------------

for /f "tokens=*" %%i in ('git branch') do set currentBGit=%%i
echo Rama Actual - Git: %currentBGit%
set /p branch=Rama: 

cls
echo git push...
git push origin %branch%

pause
goto present


