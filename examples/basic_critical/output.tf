output "policy" {
  value = {
    id                  = newrelic_alert_policy.main.id
    name                = newrelic_alert_policy.main.name
    incident_preference = newrelic_alert_policy.main.incident_preference
  }
}

output "module" {
  value = module.main
}
