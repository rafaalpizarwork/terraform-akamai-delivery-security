// Get configuration details
data "akamai_appsec_configuration" "config" {
    name = var.name
}

locals {
  all_hostnames = concat(data.akamai_appsec_configuration.config.host_names, var.new_hostnames)
}

resource "akamai_appsec_configuration" "config" {
  name        = var.name
  description = var.description
  contract_id = var.contract_id
  group_id    = var.group_id
  host_names  = local.all_hostnames
}

output "appsec_hostnames" {
  value = data.akamai_appsec_configuration.config.host_names
}
