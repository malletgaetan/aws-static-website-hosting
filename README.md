# aws-static-website-hosting

Static website automatic deployment skeleton using AWS + Terraform + Github Action

| Github Action Secret Name | value |
| ------------------------- | ----- |
| AWS_ACCESS_KEY | AWS IAM ci/cd user access key |
| AWS_SECRET_ACCESS_KEY | AWS IAM ci/cd user secret access key |
| AWS_DEFAULT_REGION | AWS region (ex: eu-west-3) |
| ROOT_DOMAIN | Route53 domain name |
| WEBSITE_DOMAIN | Website domain name (ROOT_DOMAIN or subdomain of it) |
| TF_API_TOKEN | Terraform Cloud [Token](https://www.terraform.io/cloud-docs/users-teams-organizations/api-tokens) |
