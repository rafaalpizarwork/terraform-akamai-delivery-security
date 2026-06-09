module "property" {
  source = "./modules/property"

  contract_id         = var.contract_id
  group_id            = local.group_id
  product_id          = var.product_id
  name                = var.property_name
  hostnames           = local.property_hostnames_fqdn
  enrollment_id       = module.enrollment.enrollment_id
  contact_emails      = var.contact_emails
  version_note        = var.version_note
  activation_note     = var.activation_note
  activate2staging    = var.activate2staging
  activate2production = var.activate2production
  compliance_record   = { reason = var.compliance_reason }

  origin_server                           = var.origin_server
  origin_leaf_certificate_sha1fingerprint = var.origin_leaf_certificate_sha1fingerprint
  origin_leaf_certificate_pem             = var.origin_leaf_certificate_pem
}

