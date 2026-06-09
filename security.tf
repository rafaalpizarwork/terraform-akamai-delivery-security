module "appsec" {
  source = "./modules/appsec"

  contract_id         = var.contract_id
  group_id            = local.group_id
  name                = var.appsec_config_name
  description         = var.version_note
  contact_emails      = var.contact_emails
  new_hostnames       = local.property_hostnames_fqdn
  activation_note     = var.activation_note
  activate2staging    = var.activate2staging
  activate2production = var.activate2production
}
