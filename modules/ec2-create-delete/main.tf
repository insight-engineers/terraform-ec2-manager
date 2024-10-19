# VPC
resource "aws_vpc" "ec2_vpc" {
    cidr_block = var.vpc_cidr_block

    tags = {
        Name = "${var.instance_name}-vpc"
    }
}

# Subnet
resource "aws_subnet" "ec2_subnet" {
    vpc_id                  = aws_vpc.ec2_vpc.id
    cidr_block              = var.subnet_cidr_block
    map_public_ip_on_launch = var.instance_public

    tags = {
        Name = "${var.instance_name}-subnet"
    }
}

# Internet Gateway
resource "aws_internet_gateway" "ec2_igw" {
    vpc_id = aws_vpc.ec2_vpc.id

    tags = {
        Name = "${var.instance_name}-igw"
    }
}

# Route Table
resource "aws_route_table" "ec2_route_table" {
    vpc_id = aws_vpc.ec2_vpc.id

    route {
        cidr_block = var.internet_cidr_block
        gateway_id = var.instance_public ? aws_internet_gateway.ec2_igw.id : null
    }

    tags = {
        Name = "${var.instance_name}-route-table"
    }
}

# Route Table Association
resource "aws_route_table_association" "ec2_route_table_association" {
    subnet_id      = aws_subnet.ec2_subnet.id
    route_table_id = var.instance_public ? aws_route_table.ec2_route_table.id : null
}

# Security Group
resource "aws_security_group" "ec2_sg" {
    name   = "${var.instance_name}-sg"
    vpc_id = aws_vpc.ec2_vpc.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = var.allowed_cidr_blocks
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = var.allowed_cidr_blocks
    }

    tags = {
        Name = "${var.instance_name}-sg"
    }
}

# EC2 Instance
resource "aws_instance" "ec2_instance" {
    ami                         = var.ami
    instance_type               = var.instance_type
    key_name                    = var.key_name
    subnet_id                   = aws_subnet.ec2_subnet.id
    vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
    associate_public_ip_address = var.instance_public

    tags = {
        Name = var.instance_name
    }

    root_block_device {
        volume_type = var.volume_type
        volume_size = var.volume_size
    }
}
