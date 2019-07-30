# outputs.tf

output "public_dns_name" {
  value = aws_route53_record.public_dns.name
}

