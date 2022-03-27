variable "password" {
  default = "Ccetest@2022"
}

variable "cce_cluster_name" {
  default = "tbx-cce-test"
}

variable "cce_cluster_flavor" {
  default = "cce.s2.small"
}


variable "cluster_type" {
  default = "VirtualMachine"
}

variable "cce_cluster_version" {
  default = "v1.19.10-r0"
}

variable "node_flavor" {
  default = "s6.xlarge.4"
}

variable "root_volume_size" {
  default = 40
}

variable "root_volume_type" {
  default = "SAS"
}

variable "data_volume_size" {
  default = 100
}

variable "data_volume_type" {
  default = "SAS"
}

variable "ecs_name" {
  default = "tbx-ecs"
}

variable "cce_node_os" {
  default = "CentOS 7.6"
}

variable "nodepool_name" {
  default = "nodepool1"
}
variable "scall_enable" {
  default = "true"
}

variable "vpc_id" {
  default = "will be apply"
}

variable "subnet_id" {
  default = "will be apply"
}


locals {
  eip = {
    name        = "cce-apiserver-test"
    type        = "5_bgp"
    size        = "20"
    share_type  = "PER"
    charge_mode = "traffic"
  }
}

locals {
  node_count = {
    initial = 2
    min     = 1
    max     = 2
  }
}
