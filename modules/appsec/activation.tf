resource "akamai_appsec_activations" "appsec-activation-staging" {
  config_id           = akamai_appsec_configuration.config.config_id
  network             = "STAGING"
  note                = var.activation_note
  notification_emails = var.contact_emails
  version             = var.activate2staging ? data.akamai_appsec_configuration.config.latest_version : data.akamai_appsec_configuration.config.staging_version
}

resource "akamai_appsec_activations" "appsec-activation-production" {
  config_id           = akamai_appsec_configuration.config.config_id
  network             = "PRODUCTION"
  note                = var.activation_note
  notification_emails = var.contact_emails
  version             = var.activate2production ? data.akamai_appsec_configuration.config.latest_version : data.akamai_appsec_configuration.config.production_version
}
