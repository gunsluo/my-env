#!/bin/bash

export KUBECONFIG=~/.kube/config:~/.kube/new

# export KUBECONFIG=~/.kube/config:$(find . -type f | tr '\n' ':')

kubectl config view --flatten >all-in-one-kubeconfig.yaml

# mv all-in-one-kubeconfig.yaml ~/.kube/config

# kubectl config get-clusters
