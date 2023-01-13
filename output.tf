output "nrql_alert_condition" {
  value = {
    id          = newrelic_nrql_alert_condition.this.id
    entity_guid = newrelic_nrql_alert_condition.this.entity_guid
    policy_id   = newrelic_nrql_alert_condition.this.policy_id
    name        = newrelic_nrql_alert_condition.this.name
    type        = newrelic_nrql_alert_condition.this.type
    enabled     = newrelic_nrql_alert_condition.this.enabled
    nrql_query  = newrelic_nrql_alert_condition.this.nrql[0].query
  }
}
