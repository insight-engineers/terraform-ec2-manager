# Root module: ec2
variable "aws_region" {
  description = "The AWS region to use"
  type        = string
  default     = "ap-southeast-1"
}

variable "aws_shared_config_files" {
  description = "The shared AWS configuration files to use"
  type        = list(string)
  default     = ["~/.aws/config"]
}

variable "aws_shared_credentials_files" {
  description = "The shared AWS credentials files to use"
  type        = list(string)
  default     = ["~/.aws/credentials"]
}

variable "aws_profile" {
  description = "The AWS profile to use"
  type        = string
  default     = "default"
}

# Module: ec2-start-stop
variable "instance_id" {
  description = "The ID of the instance to start or stop"
  type        = string
}

variable "instance_state" {
  description = "The state to set the instance to. Must be one of 'running' or 'stopped'"
  type        = string
  validation {
    condition     = can(regex("^(running|stopped)$", var.instance_state))
    error_message = "Instance state must be either 'running' or 'stopped'"
  }
}

variable "instance_state_force" {
  description = "Whether to force the instance state change"
  type        = bool
  default     = false
}

# Module: ec2-create-delete
variable "ami" {
  description = "The AMI to use for the instance. Defaults to the Amazon Linux 2023 AMI"
  type        = string
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use. Defaults to t2.micro"
  type        = string
  default     = "t2.micro"
}

variable "instance_public" {
  description = "Whether the instance should be public"
  type        = bool
  default     = true
}

variable "volume_size" {
  description = "The size of the volume to use for the instance"
  type        = number
  default     = 16
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "internet_cidr_block" {
  description = "CIDR block for internet access"
  type        = string
  default     = "0.0.0.0/0"
}

variable "allowed_cidr_blocks" {
  description = "Allowed CIDR blocks for security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "volume_type" {
  description = "The type of volume to use for the instance. Defaults to gp3"
  type        = string
  default     = "gp3"
}

variable "instance_init_script" {
  description = "The script to run on instance initialization"
  type        = string
  default     = <<-EOF
  #!/bin/bash
  echo "Instance created at $(date)" > ~/.instance_created
  EOF
}
