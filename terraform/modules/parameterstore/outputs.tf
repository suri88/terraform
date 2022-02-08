#output "s_password" {
  #value = aws_ssm_parameter.default.value[0]
 # value = concat(aws_ssm_parameter.default.*.value, [""])[0]
#}

