# module: ec2_start_stop
output "ec2_start_stop_instance_state" {
  value = module.ec2_start_stop.instance_state
}

# module: ec2_create_delete
output "ec2_create_delete_instance_public_ip" {
  value = module.ec2_create_delete.instance_public_ip
}

output "ec2_create_delete_instance_id" {
  value = module.ec2_create_delete.instance_id
}
