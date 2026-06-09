# --------------------------------------------------
# Comman Variables
# --------------------------------------------------
variable "edgerc_path" {
  type        = string
  description = "Autentication file path on disk"
}
variable "edgerc_section" {
  type        = string
  description = "Section inside edgerc file"
}
variable "contract_id" {
  type        = string
  description = "Akamai contract ID"
}
variable "group_name" {
  type        = string
  description = "Akamai group Name"
}
variable "version_note" {
  type        = string
  description = "Property version notes"
}
variable "activation_note" {
  type        = string
  description = "Property version notes"
}
variable "contact_emails" {
  type        = list(string)
  description = "Email to be notified about property version push"
}

# --------------------------------------------------
# Akamai activation
# --------------------------------------------------
variable "activate2staging" {
  description = "Activate the setup to staging"
  type        = bool
  default     = false
}
variable "activate2production" {
  description = "Activate the setup to production"
  type        = bool
  default     = false
}
variable "compliance_reason" {
  type        = string
  description = "Required when Akamai employee push test properties to production under internal account without PR"
}

# --------------------------------------------------
# Akamai hostname variables
# --------------------------------------------------
variable "dns_zone" {
  type        = string
  description = "DNS zone for the hostname"
}
variable "property_hostnames" {
  type        = list(string)
  description = "Akamai property entry point hostnames, host part only"
}

# --------------------------------------------------
# Akamai security configuration variables
# --------------------------------------------------
variable "appsec_config_name" {
  description = "Application Security Configuration Name"
  type        = string
}

# --------------------------------------------------
# Akamai delivery configuration variables
# --------------------------------------------------
variable "product_id" {
  type    = string
  default = "Fresca"
}
variable "property_name" {
  type        = string
  description = "Akamai property hostname only. First part of FQDN"
}
variable "origin_server" {
  type        = string
  description = "Origin server hostname"
}
variable "origin_leaf_certificate_sha1fingerprint" {
  type        = string
  default     = null
  description = "Leaf certificate to pin sha1 fingerprint"
}
variable "origin_leaf_certificate_pem" {
  type        = string
  default     = null
  description = "Leaf certificate to pin pem format"
}

# --------------------------------------------------
# CPS Certificate
# --------------------------------------------------
variable "cert_contact_details" {
  type = object({
    first_name       = string
    last_name        = string
    phone            = string
    email            = string
    address_line_one = string
    address_line_two = string
    city             = string
    country_code     = string
    organization     = string
    postal_code      = string
    region           = string
    title            = string
    unit             = string
  })
  description = "This is the person the CA contacts to verify the certificate request"
}
variable "cert_network_configuration" {
  type = object({
    disallowed_tls_versions = list(string)
    clone_dns_names         = bool
    geography               = string
    ocsp_stapling           = string
    preferred_ciphers       = string
    must_have_ciphers       = string
    quic_enabled            = bool
  })
  default = {
    disallowed_tls_versions = ["TLSv1", "TLSv1_1"]
    clone_dns_names         = true
    geography               = "core"
    ocsp_stapling           = "on"
    preferred_ciphers       = "ak-akamai-2020q1"
    must_have_ciphers       = "ak-akamai-2020q1"
    quic_enabled            = false
  }
  description = "Specify how your certificate deploys to the Akamai Secure CDN"
}
