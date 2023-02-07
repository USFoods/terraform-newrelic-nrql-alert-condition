terraform {
  required_version = ">=1.3"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~>3.13.0"
    }
  }
}

provider "newrelic" {
  account_id = var.account_id
}

resource "newrelic_alert_policy" "main" {
  name                = "Baseline Policy"
  incident_preference = "PER_CONDITION_AND_TARGET"
}

# This is the bare minimum configuration required
module "main" {
  source = "../.."

  account_id = var.account_id
  policy_id  = newrelic_alert_policy.main.id
  name       = "Baseline NRQL Alert Condition"
  type       = "baseline"
  enabled    = var.enabled

  baseline_direction = "upper_and_lower"

  query = "SELECT average(duration) FROM Transaction"

  critical = {
    threshold          = 5
    threshold_duration = 180
  }
}
