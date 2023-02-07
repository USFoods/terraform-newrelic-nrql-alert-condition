output "id" {
  description = "The ID of the NRQL alert condition"
  value       = newrelic_nrql_alert_condition.this.id
}

output "entity_guid" {
  description = "The unique entity identifier of the NRQL Condition in New Relic"
  value       = newrelic_nrql_alert_condition.this.entity_guid
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

output "description" {
  description = "The description of the NRQL alert condition"
  value       = newrelic_nrql_alert_condition.this.description
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

output "tags" {
  description = "The tags associated with the alert condition"
  value       = { for t in newrelic_entity_tags.this.tag : t.key => join(",", toset(t.values)) }
}
