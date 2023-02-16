export SCRAM_ARCH=slc7_amd64_gcc700
#!/bin/bash  

cmsenv
git cms-init


voms-proxy-init -voms cms -out ${HOME}/proxy/x509up.px --valid 168:00
echo X509_USER_PROXY=/afs/cern.ch/user/j/jhossain/proxy/x509up.px
export X509_USER_PROXY=/afs/cern.ch/user/j/jhossain/proxy/x509up.px

