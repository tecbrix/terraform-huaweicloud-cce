data "huaweicloud_availability_zones" "myaz" {}

resource "huaweicloud_vpc_eip" "cce" {
  publicip {
    type = local.eip.type
  }
  bandwidth {
    name        = local.eip.name
    size        = local.eip.size
    share_type  = local.eip.share_type
    charge_mode = local.eip.charge_mode
  }
}

resource "huaweicloud_cce_cluster" "cluster" {
  name                   = var.cce_cluster_name
  cluster_type           = var.cluster_type
  cluster_version        = var.cce_cluster_version
  flavor_id              = var.cce_cluster_flavor
  vpc_id                 = var.vpc_id
  subnet_id              = var.subnet_id
  container_network_type = "overlay_l2"
  authentication_mode    = "rbac"
  eip                    = huaweicloud_vpc_eip.cce.address
  delete_all             = "true"
}

resource "huaweicloud_cce_node_pool" "node_pool" {
  depends_on = [
    huaweicloud_cce_cluster.cluster
  ]
  cluster_id               = huaweicloud_cce_cluster.cluster.id
  name                     = var.nodepool_name
  os                       = var.cce_node_os
  initial_node_count       = local.node_count.initial
  flavor_id                = var.node_flavor
  availability_zone        = data.huaweicloud_availability_zones.myaz.names[0]
  password                 = var.password
  scall_enable             = var.scall_enable
  min_node_count           = local.node_count.min
  max_node_count           = local.node_count.max
  scale_down_cooldown_time = 100
  priority                 = 1
  type                     = "vm"

  root_volume {
    size       = var.root_volume_size
    volumetype = var.root_volume_type
  }
  data_volumes {
    size       = var.data_volume_size
    volumetype = var.data_volume_type
  }
}
