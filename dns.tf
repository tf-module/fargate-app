data "aws_route53_zone" "public_zone" {
  zone_id = var.public_zone_id
  private_zone = false
}

data "aws_route53_zone" "private_zone" {
  zone_id = var.private_zone_id
  private_zone = true
}

resource "aws_route53_record" "public_dns" {
  zone_id = data.aws_route53_zone.public_zone.zone_id
  name = "${var.environment}.${var.app_name}.${data.aws_route53_zone.public_zone.name}"
  type = "A"

  alias {
    name = aws_alb.main.dns_name
    zone_id = aws_alb.main.zone_id
    evaluate_target_health = false
  }
}
