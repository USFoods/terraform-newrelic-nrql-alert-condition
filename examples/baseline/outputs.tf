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

output "baseline_upper_only" {
  description = "Output from the baseline_upper_only module"
  value       = module.baseline_upper_only
}

output "baseline_lower_only" {
  description = "Output from the baseline_lower_only module"
  value       = module.baseline_lower_only
}

output "baseline_upper_and_lower" {
  description = "Output from the baseline_upper_and_lower module"
  value       = module.baseline_upper_and_lower
}
