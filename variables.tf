# variables.tf
locals {
  default_desc = "Managed by Terraform"
}
variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "us-west-2"
}


variable "vpc_id" {
  description = "vpc id"
}

variable "private_subnet_ids" {
  description = "private subnet ids"
}

variable "public_subnet_ids" {
  description = "public subnet ids"
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

variable "app_min_replica" {
  description = "Default/Minimum number of docker containers to run"
  default     = 1
}

variable "app_max_replica" {
  description = "Max number of docker containers to run"
  default     = 3
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

locals {
  auto_scaling_count = "${var.app_max_replica > 1 ? 1 : 0}"
}
