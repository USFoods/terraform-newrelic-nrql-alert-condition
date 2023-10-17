run "verify_policy" {
  command = apply

  assert {
    condition     = output.policy_name == "Custom Tags Policy"
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
    condition     = output.name == "Custom Tags NRQL Alert Condition"
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
    condition = output.tags == {
      "Origin" : "Terraform",
      "env" : "nonprod",
      "app.id" : "1234",
      "app.code" : "testapp"
      "support" : "tier1,tier2"
    }
    error_message = "condition tags did not match expected"
  }
}
