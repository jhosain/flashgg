export SCRAM_ARCH=slc7_amd64_gcc700
#!/bin/bash  

cmsenv
git cms-init


voms-proxy-init -voms cms --valid 168:00
cp /tmp/x509up_u95987 ~/
export X509_USER_PROXY=~/x509up_u95987
echo X509_USER_PROXY=~/x509up_u95987 
