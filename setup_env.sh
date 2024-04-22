#export XRD_NETWORKSTACK=IPv4
export SCRAM_ARCH=slc7_amd64_gcc700
#!/bin/bash  

cmsenv
git cms-init


voms-proxy-init -voms cms -out ${HOME}/proxy/x509up_u95987 --valid 168:00
#voms-proxy-init -voms cms -out ${HOME}/tmp/x509up_u95987 --valid 168:00
echo X509_USER_PROXY=/afs/cern.ch/user/j/jhossain/proxy/x509up_u95987
export X509_USER_PROXY=/afs/cern.ch/user/j/jhossain/proxy/x509up_u95987
#export X509_USER_PROXY=/afs/cern.ch/user/j/jhossain/tmp/x509up_u95987
