module "MainVPC" {
  source = "github.com/tf-module/classic-vpc-network"
  vpc_name = "Baiyuan_VPC"
  vpc_cidr = "172.17.0.0/16"
  az_count = "3"
  aws_region = "us-west-2"
}

module "GeekFormApp" {
  source = "github.com/tf-module/fargate-app"
  vpc_id = module.MainVPC.vpc_id
  private_subnet_ids = module.MainVPC.private_subnet_ids
  public_subnet_ids = module.MainVPC.public_subnet_ids
  aws_region = "us-west-2"
  app_name = "GeekFormApp"
  app_image = "nginx"
  app_port = 80
  app_min_replica = 1
  app_max_replica = 3
  fargate_cpu = "256"
  fargate_memory = "512"
  health_check_path = "/"
}
output "HomeURL" {
  value = "${module.GeekFormApp.alb_hostname}"
}
