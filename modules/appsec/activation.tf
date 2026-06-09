resource "akamai_appsec_activations" "appsec-activation-staging" {
  count = var.activate2staging ? 1 : 0

  config_id           = akamai_appsec_configuration.config.config_id
  network             = "STAGING"
  note                = var.activation_note
  notification_emails = var.contact_emails
  version             = var.activate2staging ? data.akamai_appsec_configuration.config.latest_version : data.akamai_appsec_configuration.config.staging_version
}

resource "akamai_appsec_activations" "appsec-activation-production" {
  count = var.activate2production ? 1 : 0

  config_id           = akamai_appsec_configuration.config.config_id
  network             = "PRODUCTION"
  note                = var.activation_note
  notification_emails = var.contact_emails
  version             = data.akamai_appsec_configuration.config.latest_version
}
