output "id" {
  description = "The ID of the NRQL alert condition"
  value       = newrelic_nrql_alert_condition.this.id
}

output "entity_guid" {
  description = "The unique entity identifier of the NRQL Condition in New Relic"
  value       = newrelic_nrql_alert_condition.this.entity_guid
}

output "policy_id" {

  value = tostring(newrelic_nrql_alert_condition.this.policy_id)
}

output "name" {
  description = "The title of the condition"
  value       = newrelic_nrql_alert_condition.this.name
}

output "type" {
  value = newrelic_nrql_alert_condition.this.type
}

output "enabled" {
  value = newrelic_nrql_alert_condition.this.enabled
}

output "nrql_query" {
  value = try(newrelic_nrql_alert_condition.this.nrql[0].query, "")
}

output "critical_operator" {
  value = try(newrelic_nrql_alert_condition.this.critical[0].operator, "")
}

output "critical_threshold" {
  value = try(newrelic_nrql_alert_condition.this.critical[0].threshold, "")
}

output "critical_threshold_duration" {
  value = try(newrelic_nrql_alert_condition.this.critical[0].threshold_duration, "")
}

output "critical_threshold_occurrences" {
  value = try(newrelic_nrql_alert_condition.this.critical[0].threshold_occurrences, "")
}

output "warning_operator" {
  value = try(newrelic_nrql_alert_condition.this.warning[0].operator, "")
}

output "warning_threshold" {
  value = try(newrelic_nrql_alert_condition.this.warning[0].threshold, "")
}

output "warning_threshold_duration" {
  value = try(newrelic_nrql_alert_condition.this.warning[0].threshold_duration, "")
}

output "warning_threshold_occurrences" {
  value = try(newrelic_nrql_alert_condition.this.warning[0].threshold_occurrences, "")
}

output "tags" {
  value = { for t in newrelic_entity_tags.this.tag : t.key => join(",", toset(t.values)) }
}
