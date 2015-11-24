
set THIS_DIR=%~dp0
echo %THIS_DIR%

mklink C:\Users\arkray2\editor\vim74\_test_vimrc %THIS_DIR%_vimrc
mklink C:\Users\arkray2\editor\vim74\_test_gvimrc %THIS_DIR%_gvimrc
mklink /J C:\Users\arkray2\editor\vim74\bundle2 %THIS_DIR%.vim\bundle


exit /B 0
