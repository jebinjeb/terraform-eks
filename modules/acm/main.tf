#Route53 hosted zone

resource "aws_route53_zone" "my_hosted_zone" {
  name = var.domain_name
}

#Certificate request

resource "aws_acm_certificate" "my_certificate_request" {
  domain_name               = var.domain_name
  subject_alternative_names = ["resource.{var.domain_name}","*.{var.domain_name}"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

#DNS Validation

resource "aws_route53_record" "my_validation_record" {
  zone_id = aws_route53_zone.my_hosted_zone.zone_id
  name    = aws_acm_certificate.my_certificate_request.domain_validation_options.0.resource_record_name
  type    = aws_acm_certificate.my_certificate_request.domain_validation_options.0.resource_record_type
  records = [aws_acm_certificate.my_certificate_request.domain_validation_options.0.resource_record_value]
  ttl     = var.ttl
}


#Certificate validation

resource "aws_acm_certificate_validation" "my_certificate_validation" {
  certificate_arn         = aws_acm_certificate.my_certificate_request.arn
  validation_record_fqdns = [aws_route53_record.my_validation_record.fqdn]
}