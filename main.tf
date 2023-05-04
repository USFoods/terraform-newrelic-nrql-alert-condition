resource "newrelic_nrql_alert_condition" "this" {
  account_id                     = var.account_id
  baseline_direction             = var.baseline_direction
  description                    = var.description
  policy_id                      = var.policy_id
  name                           = var.name
  type                           = var.type
  runbook_url                    = var.runbook_url
  enabled                        = var.enabled
  violation_time_limit_seconds   = var.violation_time_limit_seconds
  fill_option                    = var.fill_option
  fill_value                     = var.fill_value
  aggregation_window             = var.aggregation_window
  expiration_duration            = var.expiration_duration
  open_violation_on_expiration   = var.open_violation_on_expiration
  close_violations_on_expiration = var.close_violations_on_expiration
  aggregation_method             = var.aggregation_method
  aggregation_delay              = var.aggregation_delay
  aggregation_timer              = var.aggregation_timer
  evaluation_delay               = var.evaluation_delay
  slide_by                       = var.slide_by

  nrql {
    query = var.query
  }

  critical {
    operator              = var.critical.operator
    threshold             = var.critical.threshold
    threshold_duration    = var.critical.threshold_duration
    threshold_occurrences = var.critical.threshold_occurrences
  }

  dynamic "warning" {
    for_each = var.warning == null ? [] : [1]
    content {
      operator              = var.warning != null ? var.warning.operator : null
      threshold             = var.warning != null ? var.warning.threshold : null
      threshold_duration    = var.warning != null ? var.warning.threshold_duration : null
      threshold_occurrences = var.warning != null ? var.warning.threshold_occurrences : null
    }
  }
}

resource "newrelic_entity_tags" "this" {
  guid = newrelic_nrql_alert_condition.this.entity_guid

  tag {
    key    = "Origin"
    values = ["Terraform"]
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key    = tag.key
      values = tag.value
    }
  }
}
