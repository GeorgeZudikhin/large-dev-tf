variable "sa_token" {
  description = "API Token for Stackit provider"
  type        = string
  sensitive   = true
}

variable "stackit_project" {
  description = "StackIT Project ID"
  type        = string
  sensitive   = true
}