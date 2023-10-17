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
      enabled                     = module.enabled
      nrql_query                  = module.nrql_query
      critical_threshold          = module.critical_threshold
      critical_threshold_duration = module.critical_threshold_duration
      tags                        = module.tags
    }
  }
}
