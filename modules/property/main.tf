resource "akamai_property" "delivery_property" {
  name        = var.name
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = var.product_id

  dynamic "hostnames" {
    for_each = toset(var.hostnames)
    content {
      cname_from             = hostnames.value
      cname_to               = akamai_edge_hostname.edgekey_host[hostnames.value].edge_hostname
      cert_provisioning_type = "CPS_MANAGED"
    }
  }
  rules               = module.delivery_rules.rules
  rule_format         = module.delivery_rules.rule_format
  version_notes = var.version_note
}

output "delivery_property" {
  value = {
    name           = akamai_property.delivery_property.name
    version_notes  = akamai_property.delivery_property.version_notes
    latest_version = akamai_property.delivery_property.latest_version
  }
}
