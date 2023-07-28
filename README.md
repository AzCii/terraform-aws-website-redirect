# Terraform AWS Website Redirect

A very simple terraform module to setup a S3, Route53 to redirect web requests to a domain to another URL.

## Example Usage

```hcl
resource "aws_route53_zone" "example" {
  name = "example.com"
}

module "website-redirect" {
  source        = "github.com/AzCii/terraform-aws-website-redirect"
  redirect_from = "example.com"
  redirect_to   = "www.iana.org/help/example-domains"
  protocol      = "https"
  dns_zone_id   = aws_route53_zone.example.zone_id
}
```

## Argument Reference

The following arguments are supported:

- source - (Required) Source of the module.
- redirect_from - (Required) The domain to create the records for.
- redirect_to - (Required) The full URL you want to redirect to, without https:// or a trailing slash in the end.
- protocol - (Required) The protocol you want to use for the redirect (http or https).
- dns_zone_id - (Required) The ID of the DNS zone to create the records in.

## Attributes Reference

The following attributes are exported:

- None

## Known Issues

- At this point its not possible to carry over the protocol used from the original request, this could be added later by making the protocol field optional.
