# Staging Activation
resource "akamai_property_activation" "delivery_property_staging" {
  property_id                    = akamai_property.delivery_property.id
  contact                        = var.contact_emails
  network                        = "STAGING"
  note                           = var.version_note
  auto_acknowledge_rule_warnings = true
  version                        = var.activate2staging ? akamai_property.delivery_property.latest_version : akamai_property.delivery_property.staging_version
}

# Production Activation
resource "akamai_property_activation" "delivery_property_production" {
  property_id                    = akamai_property.delivery_property.id
  contact                        = var.contact_emails
  network                        = "PRODUCTION"
  note                           = var.version_note
  auto_acknowledge_rule_warnings = true
  version                        = var.activate2production ? akamai_property.delivery_property.latest_version : akamai_property.delivery_property.production_version
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

output "delivery_staging_active_version" {
  value = akamai_property_activation.delivery_property_staging.version
}
