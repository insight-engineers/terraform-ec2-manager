variable "instance_name" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_public" {
  type = bool
}

variable "volume_size" {
  type = number
}

variable "vpc_cidr_block" {
  type = string
}

variable "subnet_cidr_block" {
  type = string
}

variable "internet_cidr_block" {
  type = string
}

variable "allowed_cidr_blocks" {
  type = list(string)
}

variable "volume_type" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_init_script" {
  type = string
}
