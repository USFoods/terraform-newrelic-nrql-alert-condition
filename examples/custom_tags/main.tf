provider "newrelic" {
  account_id = var.account_id
}

resource "newrelic_alert_policy" "main" {
  name                = "Custom Tags Policy"
  incident_preference = "PER_CONDITION_AND_TARGET"
}

module "main" {
  source = "../.."

  account_id = var.account_id
  policy_id  = newrelic_alert_policy.main.id
  name       = "Custom Tags NRQL Alert Condition"
  enabled    = var.enabled

  query = "SELECT average(duration) FROM Transaction"

  critical = {
    threshold          = 1000
    threshold_duration = 180
  }

  tags = {
    "env"      = ["nonprod"],
    "app.id"   = ["1234"],
    "app.code" = ["testapp"],
    "support"  = ["tier1", "tier2"]
  }
}
