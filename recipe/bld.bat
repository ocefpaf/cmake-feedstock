REM Move only desired files as the downloaded package contains even Qt5 dlls
move bin\cmake.exe %LIBRARY_BIN%\
if errorlevel 1 exit 1
move bin\cmcldeps.exe %LIBRARY_BIN%\
if errorlevel 1 exit 1
move bin\cpack.exe %LIBRARY_BIN%\
if errorlevel 1 exit 1
move bin\ctest.exe %LIBRARY_BIN%\
if errorlevel 1 exit 1

REM Just make sure that no dll exists here so we can detect when cmake people
REM decide to change the dependency.
dir bin\*.dll
if not errorlevel 1 exit 1

move share %LIBRARY_PREFIX%\
if errorlevel 1 exit 1

cp %RECIPE_DIR%\Windows-Flang-Fortran.cmake %LIBRARY_PREFIX%\share\cmake-3.10\Modules\Platform\
cp %RECIPE_DIR%\FindBoost.cmake %LIBRARY_PREFIX%\share\cmake-3.10\Modules\
