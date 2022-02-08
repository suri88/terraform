# variable "profile" {
#   default = "network-upsa"
# }

variable tbl_name {
  type = "string"
  description = "describe your variable"
  default = null
}
variable tbl_hash_key {
  type = "string"
  description = "describe your variable"
  default = null
}
variable tbl_read_capacity {
  type = "string"
  description = "describe your variable"
  default = null
}
variable tbl_write_capacity {
  type = "string"
  description = "describe your variable"
  default = null
}
variable tags {
  description = "(Optional) A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}
