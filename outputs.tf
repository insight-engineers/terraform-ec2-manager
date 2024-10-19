output "instance_id" {
  value = module.ec2_create_delete.instance_id
}

output "instance_public_ip" {
  value = module.ec2_create_delete.instance_public_ip
}

output "instance_state" {
  value = module.ec2_start_stop.instance_state
}
