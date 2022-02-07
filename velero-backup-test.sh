#!/bin/bash

kubectl create ns velero-test

kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4 -n velero-test


kubectl get pod -n velero-test

kubectl get deployment -n velero-test


velero backup create velero-hello-world-test --include-namespaces velero-test


velero backup describe velero-hello-world-test

