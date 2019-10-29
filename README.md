## Flask example app

This project shows how to perform deployment for [Flask example app](http://flask.pocoo.org/).

# Requirements
- [Terraform Cloud account](https://terraform.io)
- [DigitalOcean account](https://cloud.digitalocean.com/login)

# Run
1) Fork this repo
2) Configure VCS access and workspace: https://www.terraform.io/docs/cloud/getting-started/index.html.
3) Set "Terraform Working Directory" to "terraform".
4) Edit `terraform/terraform.tf` to match your workspace (https://www.terraform.io/docs/cloud/migrate/index.html#step-5-edit-the-backend-configuration).
5) Add environment variable `DIGITALOCEAN_TOKEN=....` to match your token and set it to sensitive.
6) Follow deployment workflow https://app.terraform.io 

# Destroy
- From Terraform Cloud web console add new HCL variable `enabled = "false"` and follow workflow.
