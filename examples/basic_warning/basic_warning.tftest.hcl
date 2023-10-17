run "verify_policy" {
  command = apply

  assert {
    condition     = output.policy_name == "Basic Warning Policy"
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
    condition     = output.name == "Basic Warning NRQL Alert Condition"
    error_message = "condition name did not match expected"
  }

  assert {
    condition     = output.enabled == false
    error_message = "condition enabled did not match expected"
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
    condition     = output.critical_threshold_duration == 180
    error_message = "condition critical threshold duration did not match expected"
  }

  assert {
    condition     = output.warning_threshold == 500
    error_message = "condition warning threshold did not match expected"
  }

  assert {
    condition     = output.warning_threshold_duration == 300
    error_message = "condition warning threshold duration did not match expected"
  }

  assert {
    condition     = output.tags == { "Origin" : "Terraform" }
    error_message = "condition tags did not match expected"
  }
}
