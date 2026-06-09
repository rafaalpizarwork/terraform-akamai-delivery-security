# Staging Activation
resource "akamai_property_activation" "delivery_property_staging" {
  count = var.activate2staging ? 1 : 0

  property_id                    = akamai_property.delivery_property.id
  contact                        = var.contact_emails
  network                        = "STAGING"
  note                           = var.activation_note
  auto_acknowledge_rule_warnings = true
  version                        = akamai_property.delivery_property.latest_version
}

# Production Activation
resource "akamai_property_activation" "delivery_property_production" {
  count = var.activate2production ? 1 : 0

  property_id                    = akamai_property.delivery_property.id
  contact                        = var.contact_emails
  network                        = "PRODUCTION"
  note                           = var.activation_note
  auto_acknowledge_rule_warnings = true
  version                        = akamai_property.delivery_property.latest_version
  dynamic "compliance_record" {
    for_each = var.compliance_record != null ? [1] : []
    content {
      dynamic "noncompliance_reason_none" {
        for_each = var.compliance_record.reason == "none" ? [1] : []
        content {
          customer_email   = var.compliance_record.customer_email
          peer_reviewed_by = var.compliance_record.peer_reviewed_by
          unit_tested      = var.compliance_record.unit_tested
        }
      }

      dynamic "noncompliance_reason_no_production_traffic" {
        for_each = var.compliance_record.reason == "no_production_traffic" ? [1] : []
        content {
        }
      }
    }
  }
}
