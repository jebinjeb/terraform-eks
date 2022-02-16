#ARN of the certificate

output "certificate_arn" {
  value = aws_acm_certificate_validation.my_certificate_validation.certificate_arn
}