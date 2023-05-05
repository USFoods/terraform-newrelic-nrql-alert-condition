terraform {
  required_version = ">=1.3"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~>3.14"
    }
  }
}

provider "newrelic" {
  account_id = var.account_id
}

resource "newrelic_alert_policy" "main" {
  name                = "Basic Critical Policy"
  incident_preference = "PER_CONDITION_AND_TARGET"
}

# This is the bare minimum configuration required
module "main" {
  source = "../.."

  account_id = var.account_id
  policy_id  = newrelic_alert_policy.main.id
  name       = "Basic Critical NRQL Alert Condition"
  enabled    = var.enabled

  query = "SELECT average(duration) FROM Transaction"

  critical = {
    threshold          = 1000
    threshold_duration = 180
  }
}
