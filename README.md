# Terraform EC2 Manager

This Terraform repository contains the EC2 Terraform Manager, a tool designed to manage EC2 instances in AWS. It supports creating, starting, stopping, and destroying EC2 instances, following best practices.

## Requirements

- Terraform installed: [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- AWS account: [Create an AWS account](https://aws.amazon.com/)
- AWS CLI installed and configured: [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- AWS credentials configured: [Configure AWS credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
- AWS keypair created: [Create an AWS keypair](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)

> We won't cover the keypair creation in this guide because it's a one-time setup. Make sure you have an AWS keypair created before starting.

## Quick Start

> [!NOTE]
> Make sure you have the requirements installed and configured before starting.

To get started with creating an EC2 instance, follow the steps below:

1. Clone the repo

```bash
git clone https://github.com/insight-engineers/terraform-ec2-manager.git
cd terraform-ec2-manager
```

2. Initialize the terraform project

```bash
aws configure # Configure your AWS credentials
terraform init # Initialize the terraform project
```

3. Create `terraform.tfvars` file at the root of the project with required variables

```hcl
instance_name    = "example-server"
key_name         = "example"
```

4. Apply the terraform project using the manager script

```bash
./terraform-ec2-manager
```

5. Example usage

```bash
➜ ./terraform-ec2-manager
Success! The configuration is valid.

What action do you want to perform? Select a number:
1) plan
2) apply
3) destroy
#? 2
Which module do you want to destroy? Select a number:
1) ec2_create_delete
2) ec2_start_stop
#? 1
```

5. Check if the EC2 instance is created successfully on the AWS console

```bash
# Get the public IP of the instance
terraform output instance_public_ip

# SSH into the instance
ssh -i ~/.ssh/example.pem ec2-user@<instance_public_ip>
```

6. Destroy the EC2 instance

```bash
./terraform-manager

# Select destroy (3)
# Select the module to destroy (1)
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.