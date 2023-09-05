# Preparing Crab Job

```
cd $CMSSW_BASE/src/flashgg/MetaData/work/
cmsenv
source /cvmfs/cms.cern.ch/crab3/crab.sh
voms-proxy-init -voms cms --valid 168:00
#crab checkwrite --site= <site-name>
./prepareCrabJobs.py -p <parameterSet> -s <jsonFileWithDatasetList> -C <microAODCampaginName> --mkPilot
```

### Example for 2018
```
./prepareCrabJobs.py -p /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/microAOD_prod/CMSSW_10_6_29/src/flashgg/MicroAOD/test/microAODstd.py -s /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/microAOD_prod/CMSSW_10_6_29/src/flashgg/MetaData/work/campaigns/GluGluHToGG_MINLO_AC_2018.json --meta-conditions /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Flashgg/microAOD_prod/CMSSW_10_6_29/src/flashgg/MetaData/data/MetaConditions/Era2018_legacy_v1.json --outputPath /store/user/jhossain --outputSite T2_US_Nebraska --lumiMask /eos/user/c/cmsdqm/www/CAF/certification/Collisions18/13TeV/Legacy_2018/Cert_314472-325175_13TeV_Legacy2018_Collisions18_JSON.txt -C Era2018_legacy_v1_Summer20UL -V v2  --mkPilot

```

It will produce $CMSSW_BASE/src/flashgg/MetaData/work/Era2018_legacy_v1_Summer20UL dircetory

## Running Crab Job

```
cd $CMSSW_BASE/src/flashgg/MetaData/work/Era2018_legacy_v1_Summer20UL
cmsenv
source /cvmfs/cms.cern.ch/crab3/crab.sh
voms-proxy-init -voms cms --valid 168:00
echo crabConfig_*.py | xargs -n 1 crab sub
echo crab_* | xargs -n 1 crab status ## to check the status of the jobs
echo crab_* | xargs -n 1 crab resubmit ## to resubmit failed jobs
OR
echo pilot_*.py | xargs -n 1 crab submit ## it will submit the pilot test crab jobs
OR
crab submit -c crab_*.py
crab status -d ./crab_*
crab report crab_*

```

### MINLO MINIAOD Samples for 2016

```
“/GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/RunIISummer20UL16MiniAODv2-106X_mcRun2_asymptotic_v17-v2/MINIAODSIM”,
“/GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/RunIISummer20UL16MiniAODv2-106X_mcRun2_asymptotic_v17-v2/MINIAODSIM”,
“/GluGluHToGGPlusTwoJets_CPodd_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/RunIISummer20UL16MiniAODv2-106X_mcRun2_asymptotic_v17-v2/MINIAODSIM”
```

### LUMI for Legacy_2016

```
/eos/user/c/cmsdqm/www/CAF/certification/Collisions16/13TeV/Legacy_2016/Cert_271036-284044_13TeV_Legacy2016_Collisions16_JSON.txt 
```

### MINLO MINIAOD Samples for 2016

```
“/GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/RunIISummer20UL16MiniAODAPVv2-106X_mcRun2_asymptotic_preVFP_v11-v2/MINIAODSIM”,
“/GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/RunIISummer20UL16MiniAODAPVv2-106X_mcRun2_asymptotic_preVFP_v11-v2/MINIAODSIM”,
“/GluGluHToGGPlusTwoJets_CPodd_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/RunIISummer20UL16MiniAODAPVv2-106X_mcRun2_asymptotic_preVFP_v11-v2/MINIAODSIM”

```

### MINLO MINIAOD Samples for 2017

```
“/GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/RunIISummer20UL17MiniAODv2-106X_mc2017_realistic_v9-v2/MINIAODSIM”,
“/GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/RunIISummer20UL17MiniAODv2-106X_mc2017_realistic_v9-v2/MINIAODSIM”,
“/GluGluHToGGPlusTwoJets_CPodd_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/RunIISummer20UL17MiniAODv2-106X_mc2017_realistic_v9-v2/MINIAODSIM”

```
### LUMI for Legacy_2017

```
/eos/user/c/cmsdqm/www/CAF/certification/Collisions17/13TeV/Legacy_2017/Cert_294927-306462_13TeV_UL2017_Collisions17_GoldenJSON.txt
```
### MINLO MINIAOD Samples for 2018

```
"/GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/RunIISummer20UL17MiniAODv2-106X_mc2017_realistic_v9-v2/MINIAODSIM",         	
"/GluGluHToGGPlusTwoJets_CPodd_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/RunIISummer20UL18MiniAODv2-106X_upgrade2018_realistic_v16_L1v1-v2/MINIAODSIM",         	
"/GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/RunIISummer20UL18MiniAODv2-106X_upgrade2018_realistic_v16_L1v1-v2/MINIAODSIM"

```
LUMI for Legacy_2018

```
/eos/user/c/cmsdqm/www/CAF/certification/Collisions18/13TeV/Legacy_2018/Cert_314472-325175_13TeV_Legacy2018_Collisions18_JSON.txt

```

## Copying results from Store

```
ssh -XY jhossain@lxplus.cern.ch
voms-proxy-init -voms cms
crab checkwrite --site= <site-name>
xrdfs xrootd-local.unl.edu
ls -l /store/user/jhossain/
ssh -XY jhossain@lxplus.cern.ch
xrdcp root://xrootd-local.unl.edu//store/user/jhossain/Era2017_legacy_v1_Summer20UL/v2/GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/Era2017_legacy_v1_Summer20UL-v2-v0-RunIISummer20UL17MiniAODv2-106X_mc2017_realistic_v9-v2/230302_171839/0000/myMicroAODOutputFile_2.root /afs/cern.ch/user/j/jhossain/public/Hgg_AC_Flashgg/Ntuples_2023

```

# How to create catalog

```
SMYCAMPAIGN import -S ’/MY*FAV*SAMPLE*/*Run3Fall2030*/*’
fggManageSamples.py -C MYCAMPAIGN check -S ’/MY*FAV*SAMPLE*/*Run3Fall2030*/*’

```
### OR

```
fggManageSamples.py -C MYCAMPAIGN eosimport -S /eos/cms/mypath/
fggManageSamples.py -C MYCAMPAIGN check -S ’/MY*FAV*SAMPLE*/*Run3Fall2030*/*’

```

### OR

```
fggManageSamples.py -C Era2017_legacy_v1_Summer20UL-v2 -V v0 import
fggManageSamples.py -C Era2017_legacy_v1_Summer20UL-v2 check 

```

### OR

```
ggManageSamples.py -C Era2017_legacy_v1_Summer20UL_v2 -V v0 import -S /GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8/jhossain-Era2017_legacy_v1_Summer20UL-v2-v0-RunIISummer20UL17MiniAODv2-106X_mc2017_realistic_v9-v2-40c484617c8150a845705b37f7fbbebe/USER

fggManageSamples.py -C Era2017_legacy_v1_Summer20UL_v2 check

```

## Get list of campaigns

```
fggManageSamples.py -C Era2017_legacy_v1 list raw+grep
```
