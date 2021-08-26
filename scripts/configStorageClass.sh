#!/usr/bin/env bash
SCRIPT_DIR=$(cd $(dirname $0); pwd -P)

if [[ "$1" == "destroy" ]]; then
    echo "removing storage class..."
    kubectl delete -f "${SCRIPT_DIR}/storageclass-ibmc-vpc-block-10iops-mzr.yaml"
else 
    kubectl create -f "${SCRIPT_DIR}/storageclass-ibmc-vpc-block-10iops-mzr.yaml"
fi