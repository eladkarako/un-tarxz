@echo off

::----------------------------------current folder, no end slash (uwing 'flag end-of-word')
set "FOLDER=%~sdp1"
set "FOLDER=%FOLDER%##"
set "FOLDER=%FOLDER:\##=%"
set "FOLDER=%FOLDER:##=%"


::----------------------------------'_____.tar.xz'  (full filename)
set "LAYER1=%~nx1"


::----------------------------------'_____.tar'
set "LAYER2=%~n1"


::----------------------------------'_____' (using 'flag end-of word')
set "LAYER3=%LAYER2%"
set "LAYER3=%LAYER3%##"
set "LAYER3=%LAYER3:.tar##=%"
set "LAYER3=%LAYER3:##=%"


::----------------------------------extract to '_____.tar.xz' to '_____.tar' (using PIPE) extract to '_____' folder.
echo extracting:      1>&2
echo   %LAYER1%       1>&2
echo to               1>&2
echo   %LAYER2%       1>&2
echo (using pipe)     1>&2
echo to               1>&2
echo   %LAYER3%       1>&2
echo folder.          1>&2


echo. 1>&2
echo. 1>&2
@echo on

::add additional folder container?
::call "%~sdp07za.exe" x "%FOLDER%\%LAYER1%" -so  |  "%~sdp07za.exe" x -aoa -si -ttar -o"%LAYER3%"

::no-need for an additional folder container.
  call "%~sdp07za.exe" x "%FOLDER%\%LAYER1%" -so  |  "%~sdp07za.exe" x -aoa -si -ttar

@echo off
echo. 1>&2
echo. 1>&2


pause
exit /b %ErrorLevel%