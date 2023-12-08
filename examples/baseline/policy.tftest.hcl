run "policy_configuration" {
  command = apply

  assert {
    condition     = output.policy_name == "Baseline Policy"
    error_message = "policy name did not match expected"
  }

  assert {
    condition     = output.policy_incident_preference == "PER_CONDITION_AND_TARGET"
    error_message = "policy incident preference did not match expected"
  }
}
