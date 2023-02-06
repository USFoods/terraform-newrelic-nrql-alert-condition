variable "account_id" {
  description = "The New Relic account ID of the account you wish to create the condition"
  type        = string
}

variable "policy_id" {
  description = "The ID of the policy where this condition should be used"
  type        = string
}

variable "name" {
  description = "The title of the condition"
  type        = string
}

variable "type" {
  default = "static"
  type    = string
}

variable "description" {
  default     = ""
  description = "The description of the NRQL alert condition"
  type        = string
}

variable "runbook_url" {
  default     = ""
  description = "Runbook URL to display in notifications"
  type        = string
}

variable "enabled" {
  default     = false
  description = "value"
  type        = bool
}

variable "violation_time_limit_seconds" {
  default     = 86400
  description = "Sets a time limit, in seconds, that will automatically force-close a long-lasting incident after the time limit you select"
  type        = number
}

variable "fill_option" {
  default     = "none"
  description = "Which strategy to use when filling gaps in the signal"
  type        = string
}

variable "fill_value" {
  default     = null
  description = "This value will be used for filling gaps in the signal"
  type        = number
}

variable "aggregation_window" {
  default     = 60
  description = "The duration of the time window used to evaluate the NRQL query, in seconds"
  type        = number
}

variable "aggregation_method" {
  default     = "event_flow"
  description = "Determines when we consider an aggregation window to be complete so that we can evaluate the signal for incidents"
  type        = string
}

variable "aggregation_delay" {
  default     = 120
  description = "How long we wait for data that belongs in each aggregation window"
  type        = number
}

variable "aggregation_timer" {
  default     = null
  description = "How long we wait after each data point arrives to make sure we've processed the whole batch"
  type        = number
}

variable "expiration_duration" {
  default     = 900
  description = "The amount of time (in seconds) to wait before considering the signal expired"
  type        = number
}

variable "open_violation_on_expiration" {
  default     = false
  description = "Whether to create a new incident to capture that the signal expired"
  type        = bool
}

variable "close_violations_on_expiration" {
  default     = false
  description = "Whether to close all open incidents when the signal expires"
  type        = bool
}

variable "slide_by" {
  default     = null
  description = " Gathers data in overlapping time windows to smooth the chart line, making it easier to spot trends"
  type        = number
}

variable "baseline_direction" {
  default = null
  type    = string
}

variable "query" {
  description = "The NRQL query to execute for the condition"
  type        = string
}

variable "critical" {
  description = "The critical violation threshold values"
  type = object({
    operator              = optional(string, "ABOVE")
    threshold             = number
    threshold_duration    = number
    threshold_occurrences = optional(string, "ALL")
  })
}

variable "warning" {
  default     = null
  description = "The warning violation threshold values"
  type = object({
    operator              = optional(string, "ABOVE")
    threshold             = number
    threshold_duration    = number
    threshold_occurrences = optional(string, "ALL")
  })
}

variable "tags" {
  default     = {}
  description = "The tags that will be associated with the monitor"
  type        = map(list(string))
}
