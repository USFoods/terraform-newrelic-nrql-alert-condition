provider "newrelic" {
  account_id = var.account_id
}

locals {
  alerts = csvdecode(file("${path.module}/alerts.csv"))
}

resource "newrelic_alert_policy" "main" {
  name                = "Imported from CSV Example"
  incident_preference = "PER_CONDITION_AND_TARGET"
}

module "main" {
  for_each = { for alert in local.alerts : alert.name => alert }

  source = "../.."

  account_id = var.account_id
  policy_id  = newrelic_alert_policy.main.id
  name       = each.value.name
  enabled    = lower(each.value.enabled) == "true" && var.enabled

  query = each.value.query

  critical = {
    threshold          = each.value.critical_threshold
    threshold_duration = 180
  }

  tags = {
    "env"      = [each.value.env],
    "app.id"   = [each.value.app_id]
    "app.code" = [each.value.app_code]
  }
}
