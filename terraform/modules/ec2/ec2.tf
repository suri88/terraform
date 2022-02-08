resource "aws_instance" "this" {
  count            = var.instance_count
  ami              = var.ami
  instance_type    = var.instance_type
  subnet_id        = var.subnet_id
  key_name         = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  #associate_public_ip_address = false
  private_ip                  =  var.private_ip
  ebs_optimized = var.ebs_optimized
  get_password_data      = var.get_password_data

  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      encrypted             = lookup(root_block_device.value, "encrypted", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      kms_key_id            = lookup(root_block_device.value, "kms_key_id", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
    }
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = ebs_block_device.value.device_name
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      kms_key_id            = lookup(ebs_block_device.value, "kms_key_id", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
    }
  }
  
  tags = merge(
    {
      //"Name" = var.aws_instance_name
      "Name"  = "${var.aws_instance_name}${count.index +1}"
      "Role" = var.instance_role
    },
    var.upsa_account_tags,
  )
}
