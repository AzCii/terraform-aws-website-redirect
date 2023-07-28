variable "redirect_from" {
  description = "The fully qualified domain name you want to redirect"
}

variable "redirect_to" {
  description = "The full URL you want to redirect to, without https:// or a trailing slash in the end"
}

variable "protocol" {
  description = "The protocol you want to use for the redirect"
}

variable "dns_zone_id" {
  description = "Id of the Route53 zone of the fully qualified domain name"
}
