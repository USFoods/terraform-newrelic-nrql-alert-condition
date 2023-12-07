run "baseline_upper_and_lower" {
  command = apply

  assert {
    condition     = output.baseline_upper_and_lower.policy_id == output.policy_id
    error_message = "condition policy id did not match expected"
  }

  assert {
    condition     = output.baseline_upper_and_lower.name == "Upper and Lower Baseline NRQL Alert Condition"
    error_message = "condition name did not match expected"
  }

  assert {
    condition     = output.baseline_upper_and_lower.enabled == false
    error_message = "condition name did not match expected"
  }

  assert {
    condition     = output.baseline_upper_and_lower.type == "baseline"
    error_message = "condition type did not match expected"
  }

  assert {
    condition     = lower(output.baseline_upper_and_lower.baseline_direction) == "upper_and_lower"
    error_message = "condition baseline direction did not match expected"
  }

  assert {
    condition     = output.baseline_upper_and_lower.nrql_query == "SELECT average(duration) FROM Transaction"
    error_message = "condition nrql query did not match expected"
  }

  assert {
    condition     = output.baseline_upper_and_lower.critical_threshold == 10
    error_message = "condition critical threshold did not match expected"
  }

  assert {
    condition     = output.baseline_upper_and_lower.critical_threshold_duration == 180
    error_message = "condition critical threshold duration did not match expected"
  }

  assert {
    condition     = output.baseline_upper_and_lower.tags == { "Origin" : "Terraform" }
    error_message = "condition tags did not match expected"
  }
}
