#!/bin/bash

KIND="$HOME/go/bin/kind"

$KIND create cluster --config ../yamls/create-cluster-1.yaml --wait 30s
$KIND get kubeconfig --name cluster1 > ~/.kube/cluster1