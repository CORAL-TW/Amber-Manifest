@ECHO OFF

:init
git clone http://125.227.156.121:443/Amber/Build/coral-repo.git .manifest
pushd .manifest
git clone http://125.227.156.121:443/Amber/Build/coral-sku.git
popd
goto:eof

:help
echo "Amber Repo Script"
echo " amber.sh init      :  Initialize Amber Manifest"
echo " amber.sh sync <xxx>:  Start to sync xxx SKU. (empty for generic)"
echo " amber.sh sku yyy   :  Change SKU to yyy, then start to sync"
goto:eof

if [%1]==[] call:help

if "%1"=="init" (
    call:init
) else (
    if exist .manifest\ (
        python3 .manifest/amber.py "$1"
    ) else (
        echo "Please 'amber.sh init' first."
    )
)
