# Required variables
variable "instance_name" {
    description = "The name of the instance"
    type        = string
}

variable "key_name" {
    description = "The name of the key pair to use"
    type        = string
}

# Optional variables
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

variable "ami" {
    description = "The AMI to use for the instance. Defaults to the Amazon Linux 2023 AMI"
    type        = string
    default     = "ami-04b6019d38ea93034"
}
