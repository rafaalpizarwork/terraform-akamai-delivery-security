module "delivery_rules" {
  source = "../../delivery_rules"

  origin_server                           = var.origin_server
  cp_code_id                              = akamai_cp_code.delivery_cp_code.id
  origin_leaf_certificate_pem             = var.origin_leaf_certificate_pem
  origin_leaf_certificate_sha1fingerprint = lower(var.origin_leaf_certificate_sha1fingerprint)
}
