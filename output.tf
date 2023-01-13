output "nrql_alert_condition" {
  value = {
    id          = newrelic_nrql_alert_condition.nrql_alert_condition.id
    entity_guid = newrelic_nrql_alert_condition.nrql_alert_condition.entity_guid
    policy_id   = newrelic_nrql_alert_condition.nrql_alert_condition.policy_id
    name        = newrelic_nrql_alert_condition.nrql_alert_condition.name
    type        = newrelic_nrql_alert_condition.nrql_alert_condition.type
    enabled     = newrelic_nrql_alert_condition.nrql_alert_condition.enabled
    nrql_query  = newrelic_nrql_alert_condition.nrql_alert_condition.nrql[0].query
  }
}
