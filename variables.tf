
variable "region" {
  type        = string
  description = "(Optional) AWS Region to deploy in. Defaults to us-east-1."
  default     = "us-east-1"
}

variable "prefix" {
  type        = string
  description = "(Required) Prefix to use for all resources in this module."
}

variable "environment" {
  type        = string
  description = "(Required) Environment of all resources"
}

variable "billing_code" {
  type        = string
  description = "(Required) Billing code for network resources"
}

# Application variables

variable "ip_range" {
  default = "0.0.0.0/0"
}

variable "instance_type" {
  type        = string
  description = "(Optional) EC2 Instance type to use for web app. Defaults to t3.micro."
  default     = "t3.micro"
}

variable "tfe_organization" {
  type = string
}

variable "tfe_workspace_name" {
  type = string
}

variable "playbook_repository" {
  type        = string
  description = "repository that holds ansible plybook"
  default     = "https://github.com/ned1313/ansible-playbook-nginx.git"
}

variable "ec2_iam_role" {
  type    = string
  default = "web_app_dev_api_key_access"
}

variable "api_key_secret_id" {
  type = string
}
