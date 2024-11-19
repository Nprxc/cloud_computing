output "database" {
  value = {
    host     = module.database.fqdn
    port     = 5432
    database = module.database.database_name
    username = module.database.admin_username
    password = var.admin_password
    ssl      = "enabled"
  }
  sensitive   = true
  description = "Database connection information"
}


output "network" {
  value = {
    vnet_id           = module.network.vnet_id
    subnet_api_id     = module.network.subnet_api_id
    subnet_database_id = module.network.subnet_database_id
    subnet_storage_id = module.network.subnet_storage_id
    nsg_id            = module.network.nsg_id
  }
  description = "Network information"
}

