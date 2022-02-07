#!/bin/bash

cd /tmp

wget https://github.com/vmware-tanzu/velero/releases/download/v1.3.2/velero-v1.3.2-linux-amd64.tar.gz


tar -xvf velero-v1.3.2-linux-amd64.tar.gz -C /tmp

sudo mv /tmp/velero-v1.3.2-linux-amd64/velero /usr/local/bin


velero version


export PATH=$PATH:/usr/local/bin



velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.0.1 \
    --bucket velero-backup-rightdata \
    --backup-location-config region=us-east-1 \
    --snapshot-location-config region=us-east-1 \
    --secret-file /root/.aws/credentials



kubectl get all -n velero