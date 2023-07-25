variable "account_id" {
  description = "The New Relic account ID of the account you wish to create the condition"
  type        = string
}

variable "enabled" {
  default     = false
  description = "Whether to enable the alert condition"
  type        = bool
}
