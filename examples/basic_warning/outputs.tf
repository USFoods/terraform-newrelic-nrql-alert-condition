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

output "violation_time_limit_seconds" {
  description = "The time limit, in seconds, that will automatically force-close a long-lasting incident"
  value       = module.main.violation_time_limit_seconds
}

output "fill_option" {
  description = "Which strategy to use when filling gaps in the signal"
  value       = module.main.fill_option
}

output "fill_value" {
  description = "This value to use for filling gaps in the signal"
  value       = module.main.fill_value
}

output "aggregation_window" {
  description = "The duration of the time window used to evaluate the NRQL query, in seconds"
  value       = module.main.aggregation_window
}

output "aggregation_method" {
  description = "When we consider an aggregation window to be complete so that we can evaluate the signal for incidents"
  value       = module.main.aggregation_method
}

output "aggregation_delay" {
  description = "How long we wait for data that belongs in each aggregation window"
  value       = module.main.aggregation_delay
}

output "aggregation_timer" {
  description = "How long we wait after each data point arrives to make sure we've processed the whole batch"
  value       = module.main.aggregation_timer
}

output "expiration_duration" {
  description = "The amount of time (in seconds) to wait before considering the signal expired"
  value       = module.main.expiration_duration
}

output "open_violation_on_expiration" {
  description = "Whether to create a new incident to capture that the signal expired"
  value       = module.main.open_violation_on_expiration
}

output "close_violations_on_expiration" {
  description = "Whether to close all open incidents when the signal expires"
  value       = module.main.close_violations_on_expiration
}

output "slide_by" {
  description = "Gathers data in overlapping time windows to smooth the chart line, making it easier to spot trends"
  value       = module.main.slide_by
}

output "baseline_direction" {
  description = "The baseline direction of a baseline NRQL alert condition"
  value       = module.main.baseline_direction
}

output "nrql_query" {
  description = "The NRQL query executed for the condition"
  value       = module.main.nrql_query
}

output "critical_operator" {
  description = "The operator used when evaluating the threshold"
  value       = module.main.critical_operator
}

output "critical_threshold" {
  description = "The value which will trigger an incident"
  value       = module.main.critical_threshold
}

output "critical_threshold_duration" {
  description = "The duration, in seconds, that the threshold must violate in order to create an incident"
  value       = module.main.critical_threshold_duration
}

output "critical_threshold_occurrences" {
  description = "The criteria for how many data points must be in violation for the specified threshold duration"
  value       = module.main.critical_threshold_occurrences
}

output "warning_operator" {
  description = "The operator used when evaluating the threshold"
  value       = module.main.warning_operator
}

output "warning_threshold" {
  description = "The value which will trigger an incident"
  value       = module.main.warning_threshold
}

output "warning_threshold_duration" {
  description = "The duration, in seconds, that the threshold must violate in order to create an incident"
  value       = module.main.warning_threshold_duration
}

output "warning_threshold_occurrences" {
  description = "The criteria for how many data points must be in violation for the specified threshold duration"
  value       = module.main.warning_threshold_occurrences
}

output "tags" {
  description = "The tags associated with the alert conditions"
  value       = module.main.tags
}
