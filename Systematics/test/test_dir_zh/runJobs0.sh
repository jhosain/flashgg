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
mkdir test_dir_zh
echo "ls $X509_USER_PROXY"
ls $X509_USER_PROXY
mkdir .dasmaps 
mv das_maps_dbs_prod.js .dasmaps/ 

declare -a jobIdsMap=(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57)
/afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/Mela_Flashgg/CMSSW_10_6_29/src/flashgg/Systematics/test/test_dir_zh/workspaceVbf.py maxEvents=-1 dumpWorkspace=False doSystematics=False applyNNLOPSweight=False recalculatePDFWeights=False doPdfWeights=False vbfTagsOnly=True dumpLHE=False melaEFT=False verboseTagDump=False useParentDataset=False dumpTrees=True metaConditions=/afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/Mela_Flashgg/CMSSW_10_6_29/src/flashgg/MetaData/data/MetaConditions/Era2017_legacy_v1.json campaign=Era2017_legacy_v1_Summer20UL useAAA=True lumiMask=/afs/cern.ch/cms/CAF/CMSCOMM/COMM_DQM/certification/Collisions17/13TeV/Legacy_2017/Cert_294927-306462_13TeV_UL2017_Collisions17_GoldenJSON.txt processIdMap=/afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/Mela_Flashgg/CMSSW_10_6_29/src/flashgg/Systematics/test/test_dir_zh/config.json dataset=/ZH_HToGG_ZToAll_M125_TuneCP5_13TeV-powheg-pythia8 outputFile=test_dir_zh/output_ZH_HToGG_ZToAll_M125_TuneCP5_13TeV-powheg-pythia8.root nJobs=58 jobId=${jobIdsMap[${1}]} 
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

