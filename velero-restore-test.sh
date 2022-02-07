#!/bin/bash


kubectl delete ns velero-test

sleep 30

velero restore create --from-backup velero-hello-world-test

# velero restore describe velero-hello-world-test-xxxx
# velero restore logs velero-hello-world-test-xxxx


kubectl get all -n velero-test



