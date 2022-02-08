output "id" {
  description = "The policy's ID"
  value       = aws_iam_policy.policy.id
}

output "arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = aws_iam_policy.policy.arn
}


output "policy" {
  description = "The policy document"
  value       = aws_iam_policy.policy.policy
}
