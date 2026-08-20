# tf-azurerm-module_primitive-backup_policy_file_share

## Overview

This Terraform module creates an Azure Recovery Services Vault backup policy for Azure file shares with configurable backup schedules and retention rules.

## Usage

See [examples/complete](examples/complete) for a full working example.

## Module Development

### Pre-Requisites

The following commands should be available on your system:

- `asdf` or `mise`
- `make`
- `python3` (for pre-commit)

Additionally, your `git` user and email must be configured. Run `make configure` from the repository root to confirm that these requirements are met.

### Pre-Commit hooks

The [.pre-commit-config.yaml](.pre-commit-config.yaml) file defines hooks for Terraform formatting, validation, documentation generation, and secret detection. Hooks are installed by `make configure`. Go linting runs through `make lint` locally and in CI.

### Terratest examples

Tests in `tests/post_deploy_functional/` and `tests/post_deploy_functional_readonly/` explicitly target `examples/complete`. The functional suite applies and destroys the example; the readonly suite uses the non-destructive runner against existing infrastructure.

### Local Validation

Before pushing changes:

1. Run `make configure` successfully.
2. Sign in to Azure and select the appropriate subscription.
3. Run the linters:

```shell
make lint
```

4. When Azure credentials are available, run the integration tests (apply, test, and destroy):

```shell
make test
```

Pre-commit validation, linting, and tests also run in CI.

### Review & Merge Process

Open a pull request to `main`. The PR title must follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#specification) format to merge and drive semantic versioning. Ensure CI passes, address review feedback, and obtain the approvals required by `CODEOWNERS`.

### Automatic Updates

Shared configuration and workflows are managed through [launch-terraform-skeleton](https://github.com/launchbynttdata/launch-terraform-skeleton). Avoid one-off edits to generated skeleton files unless necessary. Use `copier check-update` and `copier update` when refreshing from the skeleton.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.117 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_backup_policy_file_share.backup_policy_file_share](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_file_share) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup"></a> [backup](#input\_backup) | n/a | <pre>object({<br/>    frequency = string<br/>    time      = optional(string)<br/>    hourly = optional(object({<br/>      interval        = number<br/>      start_time      = string<br/>      window_duration = number<br/>    }))<br/>  })</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_recovery_vault_name"></a> [recovery\_vault\_name](#input\_recovery\_vault\_name) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_retention_daily"></a> [retention\_daily](#input\_retention\_daily) | n/a | <pre>object({<br/>    count = number<br/>  })</pre> | n/a | yes |
| <a name="input_retention_monthly"></a> [retention\_monthly](#input\_retention\_monthly) | n/a | <pre>object({<br/>    count             = number<br/>    weekdays          = optional(list(string))<br/>    weeks             = optional(list(string))<br/>    days              = optional(list(number))<br/>    include_last_days = optional(bool)<br/>  })</pre> | `null` | no |
| <a name="input_retention_weekly"></a> [retention\_weekly](#input\_retention\_weekly) | n/a | <pre>object({<br/>    count    = number<br/>    weekdays = list(string)<br/>  })</pre> | `null` | no |
| <a name="input_retention_yearly"></a> [retention\_yearly](#input\_retention\_yearly) | n/a | <pre>object({<br/>    count             = number<br/>    months            = list(string)<br/>    weekdays          = optional(list(string))<br/>    weeks             = optional(list(string))<br/>    days              = optional(list(number))<br/>    include_last_days = optional(bool)<br/>  })</pre> | `null` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | n/a | `string` | `"UTC"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_policy_file_share_id"></a> [backup\_policy\_file\_share\_id](#output\_backup\_policy\_file\_share\_id) | n/a |
<!-- END_TF_DOCS -->
