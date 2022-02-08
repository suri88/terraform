output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.id
}

output app_subnet_ids {
  value = module.app-subnets.ids
}

output web_subnet_ids {
  value = module.web-subnets.ids
}

output dbs_subnet_ids {
  value = module.dbs-subnets.ids
}

/*
output tgw_attachment_id {
  value = module.attach_to_tgw.vpc_attachment_ids[0]
} */
