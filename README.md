# amber



## A repo where saves public utilities
Download file via the command below

  curl -O http://[ip:port]/coral/download/amber/-/raw/main/[filename]

### Example (Linux OS)
#### Go to ncs target folder
cd /opt/nordic/ncs/v1.9.1

#### Download repo script
curl -O http://gitsource.coralww.com/coral/download/amber/-/raw/main/amber.sh

#### Set execution permission
chmod a+x ./amber.sh

#### Init amber script manifest
amber.sh init

#### amber.sh sync <SKU> or empty SKU name for Generic Branch
amber.sh sync
