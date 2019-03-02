@echo off
  ::-----------------------explicit exit-code across program.
  set "EXIT_CODE=0"

  ::-----------------------Unicode support.
  chcp 65001 2>nul >nul

  ::-----------------------argument?
  if ["%~1"] EQU [""] ( goto NOARG )


  ::-----------------------fix when run from explorer-context-menu.
  set "WORKFOLDER=%~dp1"
  ::---use argument's directory.
  echo."%CD%" | findstr /I /C:"%WORKFOLDER%" 2>nul 1>nul
  if ["%ErrorLevel%"] NEQ ["0"] (  pushd "%WORKFOLDER%"  )
  ::---fallback to desktop
  echo."%WORKFOLDER%" | findstr /I /C:"Windows\System32" /I /C:"Windows\SysWOW64" 2>nul 1>nul
  if ["%ErrorLevel%"] EQU ["0"] (  pushd "%UserProfile%\Desktop"  )




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
  set "EXIT_CODE=%ErrorLevel%"

  @echo off
  echo. 1>&2
  echo. 1>&2
  goto END


:NOARG
  echo you must provide a full-file path as an argument. 1>&2
  set "EXIT_CODE=1"
  goto END

:END
  pause 1>&2
  exit /b %EXIT_CODE%
