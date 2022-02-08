output "Admin_password" {
  value = "${rsadecrypt(module.ec2.password_data[0], file("../../../../modules/secrets/upsa_cicd_dev_paris.pem"))}"
}

output "private_ip" {
  value = module.ec2.private_ip
}
