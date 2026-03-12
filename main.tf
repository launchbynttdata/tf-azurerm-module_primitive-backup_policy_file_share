// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

resource "azurerm_backup_policy_file_share" "backup_policy_file_share" {

  name                = var.name
  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name
  timezone            = var.timezone

  backup {
    frequency = var.backup.frequency
    time      = var.backup.time

    dynamic "hourly" {
      for_each = var.backup.hourly == null ? [] : [var.backup.hourly]

      content {
        interval        = hourly.value.interval
        start_time      = hourly.value.start_time
        window_duration = hourly.value.window_duration
      }
    }
  }

  retention_daily {
    count = var.retention_daily.count
  }

  dynamic "retention_weekly" {
    for_each = var.retention_weekly == null ? [] : [var.retention_weekly]

    content {
      count    = retention_weekly.value.count
      weekdays = retention_weekly.value.weekdays
    }
  }

  dynamic "retention_monthly" {
    for_each = var.retention_monthly == null ? [] : [var.retention_monthly]

    content {
      count             = retention_monthly.value.count
      weekdays          = retention_monthly.value.weekdays
      weeks             = retention_monthly.value.weeks
      days              = retention_monthly.value.days
      include_last_days = retention_monthly.value.include_last_days
    }
  }

  dynamic "retention_yearly" {
    for_each = var.retention_yearly == null ? [] : [var.retention_yearly]

    content {
      count             = retention_yearly.value.count
      months            = retention_yearly.value.months
      weeks             = retention_yearly.value.weeks
      weekdays          = retention_yearly.value.weekdays
      days              = retention_yearly.value.days
      include_last_days = retention_yearly.value.include_last_days
    }
  }
}
