run "baseline_lower_only" {
  command = apply

  assert {
    condition     = output.baseline_lower_only.policy_id == output.policy_id
    error_message = "condition policy id did not match expected"
  }

  assert {
    condition     = output.baseline_lower_only.name == "Lower Only Baseline NRQL Alert Condition"
    error_message = "condition name did not match expected"
  }

  assert {
    condition     = output.baseline_lower_only.enabled == false
    error_message = "condition name did not match expected"
  }

  assert {
    condition     = output.baseline_lower_only.type == "baseline"
    error_message = "condition type did not match expected"
  }

  assert {
    condition     = lower(output.baseline_lower_only.baseline_direction) == "lower_only"
    error_message = "condition baseline direction did not match expected"
  }

  assert {
    condition     = output.baseline_lower_only.nrql_query == "SELECT average(duration) FROM Transaction"
    error_message = "condition nrql query did not match expected"
  }

  assert {
    condition     = output.baseline_lower_only.critical_threshold == 2
    error_message = "condition critical threshold did not match expected"
  }

  assert {
    condition     = output.baseline_lower_only.critical_threshold_duration == 180
    error_message = "condition critical threshold duration did not match expected"
  }

  assert {
    condition     = output.baseline_lower_only.tags == { "Origin" : "Terraform" }
    error_message = "condition tags did not match expected"
  }
}
