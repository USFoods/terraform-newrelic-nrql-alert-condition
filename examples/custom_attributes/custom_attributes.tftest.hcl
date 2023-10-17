run "verify_policy" {
  command = apply

  assert {
    condition     = output.policy_name == "Custom Attributes Policy"
    error_message = "policy name did not match expected"
  }

  assert {
    condition     = output.policy_incident_preference == "PER_CONDITION_AND_TARGET"
    error_message = "policy incident preference did not match expected"
  }
}

run "verify_condition_configuration" {
  command = apply

  assert {
    condition     = output.condition_policy_id == output.policy_id
    error_message = "condition policy id did not match expected"
  }

  assert {
    condition     = output.name == "Custom Attributes NRQL Alert Condition"
    error_message = "condition name did not match expected"
  }

  assert {
    condition     = output.enabled == false
    error_message = "condition enabled did not match expected"
  }

  assert {
    condition     = output.description == "Alerts on average duration for transactions"
    error_message = "condition description did not match expected"
  }

  assert {
    condition     = output.runbook_url == "https://docs.newrelic.com/docs/apm/transactions/intro-transactions/transactions-new-relic-apm/"
    error_message = "condition runbook url did not match expected"
  }

  assert {
    condition     = output.violation_time_limit_seconds == 3600
    error_message = "condition violation time limit did not match expected"
  }

  assert {
    condition     = output.expiration_duration == 600
    error_message = "condition expiration duration did not match expected"
  }

  assert {
    condition     = output.open_violation_on_expiration == true
    error_message = "condition open violation on expiration did not match expected"
  }

  assert {
    condition     = output.close_violations_on_expiration == true
    error_message = "condition close violations on expiration did not match expected"
  }

  assert {
    condition     = output.nrql_query == "SELECT average(duration) FROM Transaction"
    error_message = "condition nrql query did not match expected"
  }

  assert {
    condition     = output.critical_threshold == 1000
    error_message = "condition critical threshold did not match expected"
  }

  assert {
    condition     = output.critical_threshold_duration == 1200
    error_message = "condition critical threshold duration did not match expected"
  }

  assert {
    condition     = output.warning_threshold == 500
    error_message = "condition warning threshold did not match expected"
  }

  assert {
    condition     = output.warning_threshold_duration == 1800
    error_message = "condition warning threshold duration did not match expected"
  }

  assert {
    condition     = output.tags == { "Origin" : "Terraform", "env" : "nonprod", "app.id" : "1234", "app.code" : "testapp" }
    error_message = "condition tags did not match expected"
  }
}
