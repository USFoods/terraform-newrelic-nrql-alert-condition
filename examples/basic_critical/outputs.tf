output "policy_id" {
    description = "The ID of the policy where this condition is used"
    value = newrelic_alert_policy.main.id
}

output "policy_name" {
    description = "The name of the policy"
    value = newrelic_alert_policy.main.name
}

output "policy_incident_preference" {
    description = "The rollup strategy for the policy"
    value = newrelic_alert_policy.main.incident_preference
}

output "id" {
  description = "The ID of the NRQL alert condition"
  value       = module.main.id
}

output "entity_guid" {
  description = "The unique entity identifier of the NRQL Condition in New Relic"
  value       = module.main.entity_guid
}

output "module_policy_id" {
  description = "The ID of the policy where this condition is used"
  value       = module.main.policy_id
}

output "name" {
  description = "The title of the condition"
  value       = module.main.name
}

output "type" {
  description = "The type of the condition"
  value       = module.main.type
}

output "description" {
  description = "The description of the NRQL alert condition"
  value       = module.main.description
}

output "runbook_url" {
  description = "Runbook URL to display in notifications"
  value       = module.main.runbook_url
}

output "enabled" {
  description = "Whether the alert condition is enabled"
  value       = module.main.enabled
}

output "nrql_query" {
  description = "The NRQL query executed for the condition"
  value       = module.main.nrql.query
}

output "critical_operator" {
  description = "The operator used when evaluating the threshold"
  value       = module.main.critical.operator
}

output "critical_threshold" {
  description = "The value which will trigger an incident"
  value       = module.main.critical.threshold
}

output "critical_threshold_duration" {
  description = "The duration, in seconds, that the threshold must violate in order to create an incident"
  value       = module.main.critical.threshold_duration
}

output "critical_threshold_occurrences" {
  description = "The criteria for how many data points must be in violation for the specified threshold duration"
  value       = module.main.critical.threshold_occurrences
}

output "warning_operator" {
  description = "The operator used when evaluating the threshold"
  value       = module.main.warning.operator
}

output "warning_threshold" {
  description = "The value which will trigger an incident"
  value       = module.main.warning.threshold
}

output "warning_threshold_duration" {
  description = "The duration, in seconds, that the threshold must violate in order to create an incident"
  value       = module.main.warning.threshold_duration
}

output "warning_threshold_occurrences" {
  description = "The criteria for how many data points must be in violation for the specified threshold duration"
  value       = module.main.warning.threshold_occurrences
}

output "tags" {
  description = "The tags associated with the alert conditions"
  value       = module.main.tags
}
