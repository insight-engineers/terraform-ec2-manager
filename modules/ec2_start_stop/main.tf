resource "aws_ec2_instance_state" "ec2_instance_state" {
  instance_id = var.instance_id
  state       = var.instance_state
  force       = var.instance_state_force
}
