output "target_group_arns" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
  value       = aws_lb_target_group.main.*.arn
}


output "tags" {
  description = "List of tags of instances"
  value       = aws_lb.this.*.tags
}
