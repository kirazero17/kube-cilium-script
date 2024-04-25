#!/bin/bash

KIND="$HOME/go/bin/kind"

$KIND create cluster --config ../yamls/create-cluster-2.yaml --wait 30s
$KIND get kubeconfig --name cluster2 > ~/.kube/cluster2