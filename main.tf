# S3 bucket for website redirect
resource "aws_s3_bucket" "website_redirect" {
  bucket = var.redirect_from
}

# Configure S3 bucket for redirect
resource "aws_s3_bucket_website_configuration" "website_redirect" {
  bucket = aws_s3_bucket.website_redirect.id
  redirect_all_requests_to {
    host_name = var.redirect_to
    protocol  = var.protocol
  }
}

# Forward DNS to S3 bucket
resource "aws_route53_record" "website_redirect" {
  zone_id = var.dns_zone_id
  name    = var.redirect_from
  type    = "A"
  alias {
    name                   = aws_s3_bucket_website_configuration.website_redirect.website_domain
    zone_id                = aws_s3_bucket.website_redirect.hosted_zone_id
    evaluate_target_health = false
  }
}
