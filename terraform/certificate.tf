# CREATE TLS CERTIFICATE FOR HTTPS CONNECTIONS
resource "aws_acm_certificate" "website" {
  provider          = aws.acm_provider
  domain_name       = var.website_domain
  validation_method = "DNS"
}

data "aws_route53_zone" "domain" {
  name         = var.root_domain
  private_zone = false
}

# DNS RECORD OF CERTIFICATE VALIDATIONS
resource "aws_route53_record" "website_validation" {
  for_each = {
    for dvo in aws_acm_certificate.website.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.domain.zone_id
}

resource "aws_acm_certificate_validation" "website" {
  provider                = aws.acm_provider
  certificate_arn         = aws_acm_certificate.website.arn
  validation_record_fqdns = [for record in aws_route53_record.website_validation : record.fqdn]
}
