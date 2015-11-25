
set THIS_DIR=%~dp0
echo %THIS_DIR%
mklink C:\Users\arkray2\editor\vim74\_vimrc %THIS_DIR%\_vimrc
mklink C:\Users\arkray2\editor\vim74\_gvimrc %THIS_DIR%\_gvimrc
mklink /J C:\Users\arkray2\editor\vim74\bundle %THIS_DIR%\.vim\bundle

rem Set up for NeoBundle
rem set NB_DIR=%THIS_DIR%\.vim\bundle\neobundle.vim
rem for %%f in (%NB_DIR%\*) do goto FinishNeoBundleInit
rem     echo "no neobundle.vim"
rem     set CURRENT_DIR=%cd%
rem     cd %NB_DIR%
rem     git submodule init
rem rem start /wait git submodule update
rem     cmd /c git submodule update
rem     cd %CURRENT_DIR%
rem     vim -e -c "NeoBundleInstall" -c "q"
rem :FinishNeoBundleInit

rem Set up for Neosnippet
rem after git submodule init & update
move %THIS_DIR%\.vim\bundle\neosnippet-snippets\neosnippets %THIS_DIR%\.vim\bundle\neosnippet-snippets\neosnippets_bu
mklink /J %THIS_DIR%\.vim\bundle\neosnippet-snippets\neosnippets %THIS_DIR%\.vim\neosnippets

rem Set up for Quickrun
copy %THIS_DIR%\.vim\vim-quickrun\autoload\quickrun.vim %THIS_DIR%\.vim\bundle\vim-quickrun\autoload\

exit /B 0
