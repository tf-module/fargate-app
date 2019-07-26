module "GeekFormApp" {
  source = "github.com/tf-module/fargate-app"

  vpc_id = "vpc-06d4373282f5993e2"
  private_subnet_ids = ["subnet-0aa0e2fb89ab815d0", "subnet-0d1c8a3e63619ac4f", "subnet-0196c0904b206c513"]
  public_subnet_ids = ["subnet-0a4254dca9a04d286", "subnet-051594425f042ccb5", "subnet-01099acf08bffecbe"]

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
