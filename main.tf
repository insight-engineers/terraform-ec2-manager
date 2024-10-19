module "ec2-create-delete" {
    source              = "./modules/ec2-create-delete"
    ami                 = var.ami
    instance_public     = var.instance_public
    instance_name       = var.instance_name
    instance_type       = var.instance_type
    key_name            = var.key_name
    volume_size         = var.volume_size
    volume_type         = var.volume_type
    vpc_cidr_block      = var.vpc_cidr_block
    allowed_cidr_blocks = var.allowed_cidr_blocks
    internet_cidr_block = var.internet_cidr_block
    subnet_cidr_block   = var.subnet_cidr_block
}

output "instance_id" {
    value = module.ec2-create-delete.instance_id
}

output "instance_public_ip" {
    value = module.ec2-create-delete.instance_public_ip
}