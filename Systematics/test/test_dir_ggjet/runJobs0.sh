#!/bin/bash
export XRD_NETWORKSTACK=IPv4
export X509_USER_PROXY=/afs/cern.ch/user/j/jhossain/proxy/x509up.px
WD=$PWD
echo
echo
echo
cd /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/Mela_Flashgg/CMSSW_10_6_29
eval $(scram runtime -sh)
cd $WD
mkdir test_dir_ggjet
echo "ls $X509_USER_PROXY"
ls $X509_USER_PROXY
mkdir .dasmaps 
mv das_maps_dbs_prod.js .dasmaps/ 

declare -a jobIdsMap=(177 62)
/afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/Mela_Flashgg/CMSSW_10_6_29/src/flashgg/Systematics/test/test_dir_ggjet/workspaceVbf.py maxEvents=-1 dumpWorkspace=False doSystematics=False applyNNLOPSweight=False recalculatePDFWeights=False doPdfWeights=False vbfTagsOnly=True dumpLHE=False melaEFT=False verboseTagDump=False useParentDataset=False dumpTrees=True metaConditions=/afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/Mela_Flashgg/CMSSW_10_6_29/src/flashgg/MetaData/data/MetaConditions/Era2017_legacy_v1.json campaign=Era2017_legacy_v1_Summer19UL useAAA=True lumiMask=/afs/cern.ch/cms/CAF/CMSCOMM/COMM_DQM/certification/Collisions17/13TeV/Legacy_2017/Cert_294927-306462_13TeV_UL2017_Collisions17_GoldenJSON.txt processIdMap=/afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/Mela_Flashgg/CMSSW_10_6_29/src/flashgg/Systematics/test/test_dir_ggjet/config.json dataset=/DiPhotonJetsBox_MGG-80toInf_13TeV-sherpa/alesauva-UL2017_2-10_6_4-v0-RunIISummer19UL17MiniAOD-106X_mc2017_realistic_v6-v3-b4ca3fbc0a606daa82bec910d90e7c99/USER outputFile=test_dir_ggjet/output_DiPhotonJetsBox_MGG-80toInf_13TeV-sherpa_alesauva-UL2017_2-10_6_4-v0-RunIISummer19UL17MiniAOD-106X_mc2017_realistic_v6-v3-b4ca3fbc0a606daa82bec910d90e7c99_USER.root nJobs=188 jobId=${jobIdsMap[${1}]}  lastAttempt=1
retval=$?
if [[ $retval != 0 ]]; then
    retval=$(( ${jobIdsMap[${1}]} + 1 )) 
fi 
if [[ $retval == 0 ]]; then
    errors=""
    for file in $(find -name '*.root' -or -name '*.xml'); do
        echo "cp -pv ${file} /afs/cern.ch/user/j/jhossain/eos/Hgg_AC_analysis/Flashgg/Ntuple_Production/Soumya_JetCat/Output"
        cp -pv $file /afs/cern.ch/user/j/jhossain/eos/Hgg_AC_analysis/Flashgg/Ntuple_Production/Soumya_JetCat/Output
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

