output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "targetgroup_arns" {
  value = module.alb.target_group_arns 
}

output "targetgroup_arn" {
  value = module.alb.target_group_arns
}