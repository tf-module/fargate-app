# logs.tf

# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "fargate_app_log_group" {
  name              = "/fargate-app/${var.app_name}"
  retention_in_days = 30

  tags = {
    Name = "${var.app_name}-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "fargate_app_log_stream" {
  name           = "${var.app_name}-log-stream"
  log_group_name = aws_cloudwatch_log_group.fargate_app_log_group.name
}

