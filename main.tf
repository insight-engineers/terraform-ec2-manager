module "ec2_create_delete" {
  source               = "./modules/ec2_create_delete"
  ami                  = var.ami
  instance_public      = var.instance_public
  instance_name        = var.instance_name
  instance_type        = var.instance_type
  key_name             = var.key_name
  volume_size          = var.volume_size
  volume_type          = var.volume_type
  vpc_cidr_block       = var.vpc_cidr_block
  allowed_cidr_blocks  = var.allowed_cidr_blocks
  internet_cidr_block  = var.internet_cidr_block
  subnet_cidr_block    = var.subnet_cidr_block
  instance_init_script = var.instance_init_script
}

module "ec2_start_stop" {
  source               = "./modules/ec2_start_stop"
  instance_id          = var.instance_id
  instance_state       = var.instance_state
  instance_state_force = var.instance_state_force
}
