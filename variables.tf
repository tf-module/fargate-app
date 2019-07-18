# variables.tf
locals {
  default_desc = "Managed by Terraform"
}
variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "us-west-2"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "app_name" {
  description = "App Name"
  default     = "FargateApp"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "bywang/magpie"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "app_default_container_count" {
  description = "Number of docker containers to run"
  default     = 1
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "256"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "512"
}

