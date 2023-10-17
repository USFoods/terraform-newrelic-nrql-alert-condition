

run "verify_policy" {
  command = apply

  assert {
    condition     = output.policy_name == "Imported from CSV Example"
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
    condition     = length(output.monitors) == length(local.alerts)
    error_message = "condition count did not match expected"
  }

  assert {
    condition     = alltrue([for alert in local.alerts : contains(keys(output.monitors), alert.name)])
    error_message = "condition count did not match expected"
  }

  assert {
    condition = alltrue([
      for alert in local.alerts :
      contains(keys(output.monitors), alert.name) &&
      output.monitors[alert.name]["enabled"] == false &&
      output.monitors[alert.name]["nrql_query"] == alert.query &&
      output.monitors[alert.name]["critical_threshold"] == tonumber(alert.critical_threshold) &&
      output.monitors[alert.name]["critical_threshold_duration"] == 180 &&
      output.monitors[alert.name]["tags"] == {
        "Origin" : "Terraform",
        "env" : alert.env,
        "app.id" : alert.app_id,
        "app.code" : alert.app_code,
      }

    ])
    error_message = "one or more conditions did not match expected"
  }
}
