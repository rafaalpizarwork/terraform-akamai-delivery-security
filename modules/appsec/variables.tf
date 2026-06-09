# --------------------------------------------------
# Comman Variables
# --------------------------------------------------
variable "contract_id" {
  type        = string
  description = "Akamai contract ID"
}
variable "group_id" {
  type        = string
  description = "Akamai group Name"
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

# --------------------------------------------------
# Akamai security configuration variables
# --------------------------------------------------
variable "new_hostnames" {
  type        = list(string)
  description = "Akamai property entry point hostnames, host part only"
}
variable "name" {
  description = "Application Security Configuration Name"
  type        = string
}
variable "description" {
  type        = string
  description = "Property version notes"
}
