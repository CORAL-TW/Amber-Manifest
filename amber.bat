@ECHO OFF

:init
git clone http://125.227.156.121:443/Amber/Build/coral-repo.git .manifest
pushd .manifest
git clone http://125.227.156.121:443/Amber/Build/coral-sku.git sku
popd
goto:eof

:help
echo "Amber Repo Script"
echo " amber.sh init         : Initialize Amber Manifest"
echo " amber.sh sync <xxx>   : Start to sync xxx SKU. (empty for generic)"
echo " amber.sh update       : Based on the SKU set at first, then sync again"
echo " amber.sh sku update   : Pull the latest SKU configurations"
echo " amber.sh [-h, --help] : Show this help message"
goto:eof

if [%1]==[] call:help

if [%1]==["init"] (
    rmdir /s /q .manifest
    call:init
) else (
    if exist .manifest\ (
        python3 .manifest/main.py %*
    ) else (
        echo "Please 'amber.sh init' first."
    )
)
