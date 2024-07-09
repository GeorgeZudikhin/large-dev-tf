terraform {
  required_providers {
    stackit = {
      source  = "stackitcloud/stackit"
      version = "0.18.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30.0"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
  }
}

resource "local_file" "kubeconfig" {
  content  = module.kubeconfig.kubeconfig
  filename = "${path.module}/kubeconfig.yaml"
}

provider "stackit" {
  region                = "eu01"
  service_account_token = var.sa_token
}

provider "kubernetes" {
  config_path = local_file.kubeconfig.filename
}

provider "kubectl" {
  config_path = local_file.kubeconfig.filename
}

module "cluster" {
  source = "./modules/cluster"
  stackit_project = var.stackit_project
}

module "kubeconfig" {
  source     = "./modules/kubeconfig"
  stackit_project = var.stackit_project
  depends_on = [module.cluster]
}