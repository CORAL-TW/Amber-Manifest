@ECHO OFF

if "%1"=="help"		goto help
if "%1"=="init"		goto init
if "%1"=="sync"		goto python
if "%1"=="update"	goto python
if "%1"=="sku" (if "%2"=="update" goto python)


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

:python
if exist .manifest\ (
	python3 .manifest\main.py %*
) else (
	echo "Please 'amber.bat init' first."
)
goto:eof