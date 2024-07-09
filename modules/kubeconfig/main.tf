terraform {
  required_providers {
    stackit = {
      source  = "stackitcloud/stackit"
      version = "0.18.1"
    }
  }
}

resource "stackit_ske_kubeconfig" "ske_kubeconfig" {
  project_id   = var.stackit_project
  cluster_name = "large-dev"
  expiration   = 2628288
  refresh      = true
}