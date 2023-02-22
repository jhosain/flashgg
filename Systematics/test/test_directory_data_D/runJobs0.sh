#!/bin/bash
export XRD_NETWORKSTACK=IPv4
export X509_USER_PROXY=/afs/cern.ch/user/j/jhossain/proxy/x509up.px
WD=$PWD
echo
echo
echo
cd /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/Emanuele_Flashgg/CMSSW_10_6_29
eval $(scram runtime -sh)
cd $WD
mkdir test_directory_data_D
echo "ls $X509_USER_PROXY"
ls $X509_USER_PROXY
mkdir .dasmaps 
mv das_maps_dbs_prod.js .dasmaps/ 

declare -a jobIdsMap=(11 2)
/afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/Emanuele_Flashgg/CMSSW_10_6_29/src/flashgg/Systematics/test/test_directory_data_D/workspaceVbf.py maxEvents=-1 dumpWorkspace=False doSystematics=False applyNNLOPSweight=True recalculatePDFWeights=False doPdfWeights=False vbfTagsOnly=True dumpLHE=False melaEFT=False verboseTagDump=False useParentDataset=False dumpTrees=True metaConditions=/afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/Emanuele_Flashgg/CMSSW_10_6_29/src/flashgg/MetaData/data/MetaConditions/Era2017_legacy_v1.json campaign=Era2017_legacy_v1_Summer19UL useAAA=True lumiMask=/afs/cern.ch/cms/CAF/CMSCOMM/COMM_DQM/certification/Collisions17/13TeV/Legacy_2017/Cert_294927-306462_13TeV_UL2017_Collisions17_GoldenJSON.txt processIdMap=/afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/Emanuele_Flashgg/CMSSW_10_6_29/src/flashgg/Systematics/test/test_directory_data_D/config.json dataset=/DoubleEG/alesauva-UL_test-10_6_4-v0-Run2017D-09Aug2019_UL2017-v1-53faf905fdb551f89c40f719673e864f/USER outputFile=test_directory_data_D/output_DoubleEG_alesauva-UL_test-10_6_4-v0-Run2017D-09Aug2019_UL2017-v1-53faf905fdb551f89c40f719673e864f_USER.root nJobs=200 jobId=${jobIdsMap[${1}]}  lastAttempt=1
retval=$?
if [[ $retval != 0 ]]; then
    retval=$(( ${jobIdsMap[${1}]} + 1 )) 
fi 
if [[ $retval == 0 ]]; then
    errors=""
    for file in $(find -name '*.root' -or -name '*.xml'); do
        echo "cp -pv ${file} /afs/cern.ch/user/j/jhossain/eos/Hgg_AC_analysis/Flashgg/Ntuple_Production/Datasets_D"
        cp -pv $file /afs/cern.ch/user/j/jhossain/eos/Hgg_AC_analysis/Flashgg/Ntuple_Production/Datasets_D
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

