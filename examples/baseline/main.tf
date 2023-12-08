provider "newrelic" {
  account_id = var.account_id
}

resource "newrelic_alert_policy" "main" {
  name                = "Baseline Policy"
  incident_preference = "PER_CONDITION_AND_TARGET"
}

module "baseline_upper_and_lower" {
  source = "../.."

  account_id = var.account_id
  policy_id  = newrelic_alert_policy.main.id
  name       = "Upper and Lower Baseline NRQL Alert Condition"
  type       = "baseline"
  enabled    = var.enabled

  baseline_direction = "upper_and_lower"

  query = "SELECT average(duration) FROM Transaction"

  critical = {
    threshold          = 10
    threshold_duration = 180
  }
}

module "baseline_lower_only" {
  source = "../.."

  account_id = var.account_id
  policy_id  = newrelic_alert_policy.main.id
  name       = "Lower Only Baseline NRQL Alert Condition"
  type       = "baseline"
  enabled    = var.enabled

  baseline_direction = "lower_only"

  query = "SELECT average(duration) FROM Transaction"

  critical = {
    threshold          = 2
    threshold_duration = 180
  }
}

module "baseline_upper_only" {
  source = "../.."

  account_id = var.account_id
  policy_id  = newrelic_alert_policy.main.id
  name       = "Upper Only Baseline NRQL Alert Condition"
  type       = "baseline"
  enabled    = var.enabled

  baseline_direction = "upper_only"

  query = "SELECT average(duration) FROM Transaction"

  critical = {
    threshold          = 5
    threshold_duration = 180
  }
}
