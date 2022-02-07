#!/bin/bash

cd /tmp

wget https://github.com/vmware-tanzu/velero/releases/download/v1.8.0-rc.1/velero-v1.8.0-rc.1-linux-amd64.tar.gz


tar -xvf velero-v1.8.0-rc.1-linux-amd64.tar.gz -C /tmp

sudo mv /tmp/velero-v1.8.0-rc.1-linux-amd64/velero /usr/local/bin


velero version


export PATH=$PATH:/usr/local/bin



velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.4.0 \
    --bucket velero-backup-rightdata \
    --backup-location-config region=us-east-1 \
    --snapshot-location-config region=us-east-1 \
    --secret-file /tmp/velero-eks/velero-credentials



kubectl get all -n velero