# --------------------------------------------------
# Comman Variables
# --------------------------------------------------
variable "contract_id" {
  type        = string
  description = "Akamai contract ID"
}
variable "group_id" {
  type        = string
  description = "Akamai group ID"
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
    type = bool
    default = false
}
variable "activate2production" {
    description = "Activate the setup to production"
    type = bool
    default = false
}
variable "compliance_record" {
  type = object({
    reason           = string
    peer_reviewed_by = optional(string)
    customer_email   = optional(string)
    unit_tested      = optional(bool)
  })
  validation {
    condition     = var.compliance_record == null ? true : contains(["none", "other", "no_production_traffic", "emergency"], var.compliance_record.reason)
    error_message = "Status must be one of none, no_production_traffic, emergency"
  }
  default = null
  description = "For Akamai internal change management process"
}

# --------------------------------------------------
# Akamai delivery configuration variables
# --------------------------------------------------
variable "hostnames" {
  type        = list(string)
  description = "Akamai property entry point hostnames, host part only"
}
variable "product_id" {
  type    = string
  default = "Fresca"
}
variable "name" {
  type        = string
  description = "Akamai delivery property name"
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


variable "enrollment_id" {
  type        = string
  description = "The enrollment id of the certificate"
}
