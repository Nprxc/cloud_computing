output "database" {
  value = length(module.database) == 0 ? null : {
    host     = local.database_connection.host
    port     = local.database_connection.port
    database = var.database_name
    username = var.database_username
    password = var.database_password
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

