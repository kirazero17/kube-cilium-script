helm install cilium cilium/cilium \
--namespace kube-system \
--set hubble.relay.enabled=true \
--set hubble.ui.enabled=true \
--set clustermesh.apiserver.metrics.kvstoremesh.enabled=true \
--set prometheus.enabled=true \
--set operator.prometheus.enabled=true \
--set hubble.enabled=true \
--set hubble.metrics.enableOpenMetrics=true \
--set cluster.name=cluster1 --set cluster.id=1 \
--set hubble.metrics.enabled="{dns,drop,tcp,flow,port-distribution,icmp,httpV2:exemplars=true;labelsContext=source_ip\,source_namespace\,source_workload\,destination_ip\,destination_namespace\,destination_workload\,traffic_direction}" \

helm install cilium cilium/cilium \
--namespace kube-system \
--set hubble.relay.enabled=true \
--set hubble.ui.enabled=true \
--set clustermesh.apiserver.metrics.kvstoremesh.enabled=true \
--set prometheus.enabled=true \
--set operator.prometheus.enabled=true \
--set hubble.enabled=true \
--set hubble.metrics.enableOpenMetrics=true \
--set cluster.name=cluster2 --set cluster.id=2 \
--set hubble.metrics.enabled="{dns,drop,tcp,flow,port-distribution,icmp,httpV2:exemplars=true;labelsContext=source_ip\,source_namespace\,source_workload\,destination_ip\,destination_namespace\,destination_workload\,traffic_direction}" \

cilium clustermesh enable --context kind-cluster1 --enable-kvstoremesh --service-type NodePort

cilium clustermesh enable --context kind-cluster2 --enable-kvstoremesh --service-type NodePort

cilium clustermesh connect --context kind-cluster1 --destination-context kind-cluster2

cilium clustermesh connect --context kind-cluster2 --destination-context kind-cluster1
