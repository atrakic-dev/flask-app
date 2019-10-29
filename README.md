## Flask example app

This project shows how to perform deployment for [Flask](http://flask.pocoo.org/) example app.

# Requirements

- [Terraform Cloud account](https://terraform.io)
- [DigitalOcean account](https://cloud.digitalocean.com/login)

# Run
1) Fork this repo
2) Configure VCS access and workspace: https://www.terraform.io/docs/cloud/getting-started/index.html.
3) Edit `terraform/terraform.tf` to match your workspace (https://www.terraform.io/docs/cloud/migrate/index.html#step-5-edit-the-backend-configuration).
4) Add environment variable `DIGITALOCEAN_TOKEN=....`and` to match your token and set it to sensitive.
5) Follow deployment workflow https://app.terraform.io

## To destroy
- Edit `terraform/terraform.tfvars` and set to `"false"` to destroy droplet.
