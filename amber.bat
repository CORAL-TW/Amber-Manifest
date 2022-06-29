@ECHO OFF

IF "%1"=="help"		goto help
IF "%1"=="init"		goto init
IF "%1"=="sync"		goto pre-python
IF "%1"=="update"	goto pre-python
IF "%1"=="sku" (IF "%2"=="update" goto pre-python)


:help
echo "Amber Repo Script"
echo " amber.bat init         : Initialize Amber Manifest"
echo " amber.bat sync <xxx>   : Start to sync xxx SKU. (empty for generic)"
echo " amber.bat update       : Based on the SKU set at first, then sync again"
echo " amber.bat sku update   : Pull the latest SKU configurations"
echo " amber.bat [-h, --help] : Show this help message"
goto:eof

:init
rmdir .manifest /s /q 
git clone http://125.227.156.121:443/Amber/Build/coral-repo.git .manifest
pushd .manifest
git clone http://125.227.156.121:443/Amber/Build/coral-sku.git sku
popd
goto:eof

:pre-python
SET PY_COMMAND="py"
where py.exe >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
	goto python
) ELSE (
	echo "Please check python install correctly"
	goto:eof
)

:python
IF exist .manifest\ (
	%PY_COMMAND% .manifest\main.py %*
) ELSE (
	echo "Please 'amber.bat init' first."
)
goto:eof
