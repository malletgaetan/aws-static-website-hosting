# CAN BE root_domain OR A SUB DOMAIN OF IT
variable "website_domain" {
  type        = string
  description = "domain name of website (ex: learn.hashicorp.com)"
}

# ROOT DOMAIN OF WEBSITE DOMAIN
variable "root_domain" {
  type        = string
  description = "root domain name of website (ex: hashicorp.com)"
}