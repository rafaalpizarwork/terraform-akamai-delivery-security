# Get group ID from contract ID and group Name

data "akamai_group" "group" {
  contract_id = var.contract_id
  group_name  = var.group_name
}

locals {
  group_id                = trimprefix(data.akamai_group.group.id, "grp_")
  property_hostnames_fqdn = [for host in var.property_hostnames : "${host}.${var.dns_zone}"]
}
