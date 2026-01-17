resource "aws_route53_record" "r53" {
  for_each = var.instance_name
  zone_id = var.zone_id
  name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type = "A"
  ttl = 1
  records = each.key == "frontend" ? [aws_instance.ec2[each.key].public_ip] : [aws_instance.ec2[each.key].private_ip]
  allow_overwrite = true
}