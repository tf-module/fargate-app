module "GeekFormApp" {
  source = "github.com/tf-module/fargate-app"
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
