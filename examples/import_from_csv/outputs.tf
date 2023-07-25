output "policy_id" {
  description = "The ID of the policy where this condition is used"
  value       = newrelic_alert_policy.main.id
}

output "policy_name" {
  description = "The name of the policy"
  value       = newrelic_alert_policy.main.name
}

output "policy_incident_preference" {
  description = "The rollup strategy for the policy"
  value       = newrelic_alert_policy.main.incident_preference
}

output "monitors" {
  description = "The alert conditions created"
  value = {
    for module in module.main : module.name => {
      enabled            = tostring(module.enabled)
      nrql_query         = module.nrql_query
      critical_threshold = tostring(module.critical_threshold)
    }
  }
}
