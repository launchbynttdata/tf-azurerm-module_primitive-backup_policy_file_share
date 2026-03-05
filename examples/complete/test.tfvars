#
location = "eastus"

class_env         = "dev"
instance_env      = "001"
instance_resource = "001"

logical_product_family  = "demo"
logical_product_service = "backup"

tags = {
  environment = "test"
  terraform   = "true"
  provisioner = "terraform"
}

resource_names_map = {
  resource_group = {
    name       = "rg"
    max_length = 80
  }

  recovery_vault = {
    name       = "rv"
    max_length = 50
  }

  backup_policy_file_share = {
    name       = "bp"
    max_length = 50
  }
}
