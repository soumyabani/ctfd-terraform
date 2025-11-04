
# CTFd on AWS EC2 + Terraform Integration

## Introduction

This guide details how to:
- Deploy a CTFd instance on an AWS EC2 server.
- Install Terraform.
- Manage CTFd resources (such as challenges, flags, hints) via Terraform.

## Prerequisites

- AWS account with permissions to create EC2 instances.
- SSH key pair (.pem file) for EC2 access.
- [Terraform documentation].

## Step 1: Launch EC2 Instance

1. Spin up an Ubuntu EC2 instance from the AWS Console.
2. SSH into the server:
   ```
   ssh -i "mykey.pem" ubuntu@<your-ec2-public-ip>
   ```

## Step 2: Install CTFd

Follow the standard installation steps:
- Clone the repository:
  ```
  git clone https://github.com/CTFd/CTFd.git
  ```
- Install dependencies and configure as per [CTFd official docs].

## Step 3: Install Terraform

Run the following commands:
```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

gpg --no-default-keyring \
  --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  --fingerprint

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com/ $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform
```

## Step 4: Connect Terraform to CTFd (ctfd Provider)

Create your Terraform files as shown below.

### provider.tf example

```hcl
terraform {
  required_providers {
    ctfd = {
      source  = "ctfer-io/ctfd"
      version = "2.6.0"
    }
  }
}

provider "ctfd" {
  url    = var.ctfd_url
  api_key = var.ctfd_token
}
```

Set your CTFd URL (e.g., http://localhost:8000 or http://<your-ec2-public-ip>:8000) and API token.

### main.tf example

```hcl
resource "ctfd_challenge_standard" "http" {
  name        = "Challenge1"
  category    = "cryptography"
  description = "This is a cryptography based challenge"
  value       = 500
  topics      = [ "cryptography" ]
  tags        = [ "basic" ]
}

resource "ctfd_flag" "http_flag" {
  challenge_id = ctfd_challenge_standard.http.id
  content      = "CTFflag"
}

resource "ctfd_hint" "http_hint_1" {
  challenge_id = ctfd_challenge_standard.http.id
  content      = "Some super-helpful hint"
  cost         = 100
}
```

## Step 5: Generate Your Admin API Token in CTFd

1. Log in to your CTFd Admin account.
2. Click your profile icon → Settings.
3. Go to the **Access Tokens** tab.
4. Set an expiration (default is 30 days).
5. Click **Generate** to create a new token.
6. Copy the generated token (it won't be shown again).
7. Use this token for `var.ctfd_token` in Terraform.



Would you like sample variable definitions or more advanced Terraform resource examples?

[1](https://github.com/CTFd/CTFd.git)
