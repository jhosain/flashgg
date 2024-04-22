#!/bin/bash

echo -n "Year (Select: 2016preVFP, 2016postVFP, 2017, 2018) : "
read YEAR

echo -n "Production Mode (Select: sig, ggh, vbfh, wh, zh, tth) : "
read PROD

jsonDir="$CMSSW_BASE/src/flashgg/Systematics/test/runGGHAC/json_${YEAR}/${PROD}_jobs_${YEAR}_UL.json"

outDir="${PROD}_jobs_${YEAR}_UL"

storageDir="/afs/cern.ch/user/j/jhossain/Ntuple_Production/Prod_Signal"

mkdir -p "${storageDir}/${outDir}"

fggRunJobs.py --load ${jsonDir} -d ${outDir} workspaceGGH.py dumpWorkspace=False dumpTrees=True doSystematics=True applyNNLOPSweight=False recalculatePDFWeights=True doPdfWeights=True vbfTagsOnly=True dumpLHE=False melaEFT=False verboseTagDump=False useParentDataset=False pujidWP=tight maxEvents=-1 --stage-to=${storageDir}/${outDir} -q workday -n 200 -H -P --no-copy-proxy --no-use-tarball copyInputMicroAOD=1

