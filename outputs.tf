output "kube_config_raw" {
  value = huaweicloud_cce_cluster.cluster.kube_config_raw
}

output "certificate_clusters" {
  value = huaweicloud_cce_cluster.cluster.certificate_clusters
}

output "certificate_users" {
  value = huaweicloud_cce_cluster.cluster.certificate_users
}
