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
  name                = "Custom Attributes Policy"
  incident_preference = "PER_CONDITION_AND_TARGET"
}

module "main" {
  source = "../.."

  account_id                   = var.account_id
  policy_id                    = newrelic_alert_policy.main.id
  name                         = "Custom Attributes NRQL Alert Condition"
  enabled                      = var.enabled
  description                  = "Alerts on average duration for transactions"
  runbook_url                  = "https://docs.newrelic.com/docs/apm/transactions/intro-transactions/transactions-new-relic-apm/"
  violation_time_limit_seconds = 3600

  aggregation_window = 300
  aggregation_delay  = 300

  expiration_duration            = 600
  open_violation_on_expiration   = true
  close_violations_on_expiration = true


  query = "SELECT average(duration) FROM Transaction"

  critical = {
    threshold          = 1000
    threshold_duration = 1200
  }

  warning = {
    threshold          = 500
    threshold_duration = 1800
  }

  tags = {
    "env"      = ["nonprod"],
    "app.id"   = ["1234"]
    "app.code" = ["testapp"]
  }
}
