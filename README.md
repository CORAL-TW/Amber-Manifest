# amber

## A repo where saves public utilities
Download file via the command below

`curl -O http://[ip:port]/coral/download/amber/-/raw/main/[filename]`

### Example (Linux OS)
#### Go to ncs target folder
`cd /opt/nordic/ncs/v2.4.0`

#### Download repo script
`curl -0 https://raw.githubusercontent.com/CoralSense/Amber-Manifest/main/amber.sh > amber.sh`

#### Set execution permission
`chmod a+x ./amber.sh`

#### Init amber script manifest
`amber.sh init`

#### amber.sh sync [SKU]
###### empty SKU name for Generic Branch
`amber.sh sync`
