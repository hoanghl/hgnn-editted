#!/bin/bash
## Template created by Hoang Le
## Dec 2, 2020

## NOTE: All code below is dedicated for running in Tesssera.


WORKING_PLACE="dgx"
CONDA_ENV_NAME="pytorch_cuda11"
PROJECT_NAME="hgnn-editted"
DATA_FILE=""
PRETRAINED_FILE=""

if [ $WORKING_PLACE = "dgx" ]
then
    INIT_PATH_ISILON="/mnt/vinai"
elif [ $WORKING_PLACE = "rtx" ]; then
    INIT_PATH_ISILON="/vinai/hoanglh88"
else
    echo "Variable WORKING_PLACE invalid."
    return 1
fi


echo "=============================="
echo "===== SCRIPT for Tessera ====="
echo "=============================="
echo "Working place:" $WORKING_PLACE
NOW=$(date +"%b-%d-%Y %r")
echo "Start time   :" $NOW

## By default, pwd is "/root"
echo "0. Do some miscellaneous things"

echo "0.2. Activate conda and environment"
export PATH="/opt/miniconda3/bin:$PATH"
source activate $INIT_PATH_ISILON/conda_env/$CONDA_ENV_NAME


echo "2. Do main work"
## Clone code from git
git clone --single-branch --branch dev https://github.com/tommyjohn1001/hgnn-editted.git

cd $PROJECT_NAME || return
bash launcher.sh

echo "3. Wrap up data only"
# cd ..
# tar -czvf HotpotQA.tar.gz $DATA_FILE
# mv HotpotQA.tar.gz $INIT_PATH_ISILON/$DATA_FILE

echo "=============================="
echo "=====+=END OF RUNNING========="
echo "Working place:" $WORKING_PLACE
NOW=$(date +"%b-%d-%Y %r")
echo "END time   :" $NOW


