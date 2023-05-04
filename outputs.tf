output "id" {
  description = "The ID of the NRQL alert condition"
  value       = newrelic_nrql_alert_condition.this.id
}

output "entity_guid" {
  description = "The unique entity identifier of the NRQL Condition in New Relic"
  value       = newrelic_nrql_alert_condition.this.entity_guid
}

output "account_id" {
  description = "The New Relic account ID of the account you wish to create the condition"
  value       = newrelic_nrql_alert_condition.this.account_id
}

output "baseline_direction" {
  description = "The baseline direction of a baseline NRQL alert condition"
  value       = newrelic_nrql_alert_condition.this.baseline_direction
}

output "description" {
  description = "The description of the NRQL alert condition"
  value       = newrelic_nrql_alert_condition.this.description
}

output "policy_id" {
  description = "The ID of the policy where this condition is used"
  value       = tostring(newrelic_nrql_alert_condition.this.policy_id)
}

output "name" {
  description = "The title of the condition"
  value       = newrelic_nrql_alert_condition.this.name
}

output "type" {
  description = "The type of the condition"
  value       = newrelic_nrql_alert_condition.this.type
}

output "runbook_url" {
  description = "Runbook URL to display in notifications"
  value       = newrelic_nrql_alert_condition.this.runbook_url
}

output "enabled" {
  description = "Whether the alert condition is enabled"
  value       = newrelic_nrql_alert_condition.this.enabled
}

output "nrql_query" {
  description = "The NRQL query executed for the condition"
  value       = try(newrelic_nrql_alert_condition.this.nrql[0].query, "")
}

output "critical_operator" {
  description = "The operator used when evaluating the threshold"
  value       = try(newrelic_nrql_alert_condition.this.critical[0].operator, "")
}

output "critical_threshold" {
  description = "The value which will trigger an incident"
  value       = try(newrelic_nrql_alert_condition.this.critical[0].threshold, "")
}

output "critical_threshold_duration" {
  description = "The duration, in seconds, that the threshold must violate in order to create an incident"
  value       = try(newrelic_nrql_alert_condition.this.critical[0].threshold_duration, "")
}

output "critical_threshold_occurrences" {
  description = "The criteria for how many data points must be in violation for the specified threshold duration"
  value       = try(newrelic_nrql_alert_condition.this.critical[0].threshold_occurrences, "")
}

output "warning_operator" {
  description = "The operator used when evaluating the threshold"
  value       = try(newrelic_nrql_alert_condition.this.warning[0].operator, "")
}

output "warning_threshold" {
  description = "The value which will trigger an incident"
  value       = try(newrelic_nrql_alert_condition.this.warning[0].threshold, "")
}

output "warning_threshold_duration" {
  description = "The duration, in seconds, that the threshold must violate in order to create an incident"
  value       = try(newrelic_nrql_alert_condition.this.warning[0].threshold_duration, "")
}

output "warning_threshold_occurrences" {
  description = "The criteria for how many data points must be in violation for the specified threshold duration"
  value       = try(newrelic_nrql_alert_condition.this.warning[0].threshold_occurrences, "")
}

output "violation_time_limit_seconds" {
  description = "The time limit, in seconds, that will automatically force-close a long-lasting incident"
  value       = newrelic_nrql_alert_condition.this.violation_time_limit_seconds
}

output "fill_option" {
  description = "Which strategy to use when filling gaps in the signal"
  value       = newrelic_nrql_alert_condition.this.fill_option
}

output "fill_value" {
  description = "This value to use for filling gaps in the signal"
  value       = newrelic_nrql_alert_condition.this.fill_value
}

output "aggregation_window" {
  description = "The duration of the time window used to evaluate the NRQL query, in seconds"
  value       = newrelic_nrql_alert_condition.this.aggregation_window
}

output "expiration_duration" {
  description = "The amount of time (in seconds) to wait before considering the signal expired"
  value       = newrelic_nrql_alert_condition.this.expiration_duration
}

output "open_violation_on_expiration" {
  description = "Whether to create a new incident to capture that the signal expired"
  value       = newrelic_nrql_alert_condition.this.open_violation_on_expiration
}

output "close_violations_on_expiration" {
  description = "Whether to close all open incidents when the signal expires"
  value       = newrelic_nrql_alert_condition.this.close_violations_on_expiration
}

output "aggregation_method" {
  description = "When we consider an aggregation window to be complete so that we can evaluate the signal for incidents"
  value       = newrelic_nrql_alert_condition.this.aggregation_method
}

output "aggregation_delay" {
  description = "How long we wait for data that belongs in each aggregation window"
  value       = newrelic_nrql_alert_condition.this.aggregation_delay
}

output "aggregation_timer" {
  description = "How long we wait after each data point arrives to make sure we've processed the whole batch"
  value       = newrelic_nrql_alert_condition.this.aggregation_timer
}

output "evaluation_delay" {
  description = "How long we wait until the signal starts evaluating"
  value       = newrelic_nrql_alert_condition.this.evaluation_delay
}

output "slide_by" {
  description = "Gathers data in overlapping time windows to smooth the chart line, making it easier to spot trends"
  value       = newrelic_nrql_alert_condition.this.slide_by
}

output "tags" {
  description = "The tags associated with the alert condition"
  value       = { for t in newrelic_entity_tags.this.tag : t.key => join(",", toset(t.values)) }
}
