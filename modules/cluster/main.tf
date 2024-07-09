terraform {
  required_providers {
    stackit = {
      source  = "stackitcloud/stackit"
      version = "0.18.1"
    }
  }
}

resource "stackit_ske_cluster" "large-dev" {
  project_id             = var.stackit_project
  name                   = "large-dev"
  kubernetes_version_min = "1.29.6"
  node_pools = [
    {
      name               = "np-dev"
      machine_type       = "c1.2"
      os_version_min     = "3815.2.2"
      minimum            = "3"
      maximum            = "10"
      availability_zones = ["eu01-3"]
    }
  ]
}