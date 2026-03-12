variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "recovery_vault_name" {
  type = string
}

variable "timezone" {
  type    = string
  default = "UTC"
}

variable "backup" {
  type = object({
    frequency = string
    time      = optional(string)
    hourly = optional(object({
      interval        = number
      start_time      = string
      window_duration = number
    }))
  })
}

variable "retention_daily" {
  type = object({
    count = number
  })
}

variable "retention_weekly" {
  type = object({
    count    = number
    weekdays = list(string)
  })
  default = null
}

variable "retention_monthly" {
  type = object({
    count             = number
    weekdays          = optional(list(string))
    weeks             = optional(list(string))
    days              = optional(list(number))
    include_last_days = optional(bool)
  })
  default = null
}

variable "retention_yearly" {
  type = object({
    count             = number
    months            = list(string)
    weekdays          = optional(list(string))
    weeks             = optional(list(string))
    days              = optional(list(number))
    include_last_days = optional(bool)
  })
  default = null
}
