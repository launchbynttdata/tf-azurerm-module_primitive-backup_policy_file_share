# tf-azurerm-module_primitive-backup_policy_file_share
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.117 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.117.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_backup_policy_file_share.backup_policy_file_share](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_file_share) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_recovery_vault_name"></a> [recovery\_vault\_name](#input\_recovery\_vault\_name) | n/a | `string` | n/a | yes |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | n/a | `string` | `"UTC"` | no |
| <a name="input_backup"></a> [backup](#input\_backup) | n/a | <pre>object({<br/>    frequency = string<br/>    time      = optional(string)<br/>    hourly = optional(object({<br/>      interval        = number<br/>      start_time      = string<br/>      window_duration = number<br/>    }))<br/>  })</pre> | n/a | yes |
| <a name="input_retention_daily"></a> [retention\_daily](#input\_retention\_daily) | n/a | <pre>object({<br/>    count = number<br/>  })</pre> | n/a | yes |
| <a name="input_retention_weekly"></a> [retention\_weekly](#input\_retention\_weekly) | n/a | <pre>object({<br/>    count    = number<br/>    weekdays = list(string)<br/>  })</pre> | `null` | no |
| <a name="input_retention_monthly"></a> [retention\_monthly](#input\_retention\_monthly) | n/a | <pre>object({<br/>    count             = number<br/>    weekdays          = optional(list(string))<br/>    weeks             = optional(list(string))<br/>    days              = optional(list(number))<br/>    include_last_days = optional(bool)<br/>  })</pre> | `null` | no |
| <a name="input_retention_yearly"></a> [retention\_yearly](#input\_retention\_yearly) | n/a | <pre>object({<br/>    count             = number<br/>    months            = list(string)<br/>    weekdays          = optional(list(string))<br/>    weeks             = optional(list(string))<br/>    days              = optional(list(number))<br/>    include_last_days = optional(bool)<br/>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_policy_file_share_id"></a> [backup\_policy\_file\_share\_id](#output\_backup\_policy\_file\_share\_id) | n/a |
<!-- END_TF_DOCS -->
