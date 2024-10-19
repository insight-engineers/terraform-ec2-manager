# Terraform EC2 Manager

This terraform repo contains the necessary code to manage EC2 instances in AWS, including the creation of the instances, starting and stopping them, and destroying them,... with best practices.

## Requirements

- Terraform installed: [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- AWS account: [Create an AWS account](https://aws.amazon.com/)
- AWS CLI installed and configured: [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- AWS credentials configured: [Configure AWS credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)

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

4. Apply the terraform project

```bash
# (Optional) Plan the terraform project if you want to see the changes before applying them
terraform plan

# Apply the terraform project
terraform apply
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
terraform destroy
```


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.