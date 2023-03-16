#!/bin/bash
export XRD_NETWORKSTACK=IPv4
scp -p lxplus781:/tmp/x509up_u95987 .
export X509_USER_PROXY=$PWD/x509up_u95987
WD=$PWD
echo
echo
echo
cd /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/microAOD_prod/CMSSW_10_6_29
eval $(scram runtime -sh)
cd $WD
mkdir .fgg
echo "ls $X509_USER_PROXY"
ls $X509_USER_PROXY
mkdir .dasmaps 
mv das_maps_dbs_prod.js .dasmaps/ 

fggCheckFile.py /store/user/jhossain/Era2017_legacy_v1_Summer20UL/v2/GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/Era2017_legacy_v1_Summer20UL-v2-v0-RunIISummer20UL17MiniAODv2-106X_mc2017_realistic_v9-v2/230304_092753/0000/myMicroAODOutputFile_336.root .tmp0e51414fd3fb6dce274214c6e22a0b7fd3795c9f559dddaa627892b490f72a85_410.json /GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/jhossain-Era2017_legacy_v1_Summer20UL-v2-v0-RunIISummer20UL17MiniAODv2-106X_mc2017_realistic_v9-v2-dba47b1192ec1eec8f63d5c720fe8f2a/USER 410  
retval=$?
if [[ $retval == 0 ]]; then
    errors=""
    for file in $(find -name .tmp*.json); do
        echo "cp -pv ${file} /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/microAOD_prod/CMSSW_10_6_29/src/flashgg/MetaData/data/Era2017_legacy_v1_Summer20UL_v2"
        cp -pv $file /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/microAOD_prod/CMSSW_10_6_29/src/flashgg/MetaData/data/Era2017_legacy_v1_Summer20UL_v2
        if [[ $? != 0 ]]; then
            errors="$errors $file($?)"
        fi
    done
    if [[ -n "$errors" ]]; then
       echo "Errors while staging files"
       echo "$errors"
       exit -2
    fi
fi

exit $retval

