output "id" {
  description = "List of IDs of instances"
  value       = aws_instance.this.*.id
}

output "subnet_id" {
  description = "List of IDs of VPC subnets of instances"
  value       = aws_instance.this.*.subnet_id
}

output "password_data" {
  description = "List of Base-64 encoded encrypted password data for the instance"
  value       = aws_instance.this.*.password_data
}

output "private_ip" {
  value = aws_instance.this.*.private_ip
}

output "tags" {
  description = "List of tags of instances"
  value       = aws_instance.this.*.tags
}
