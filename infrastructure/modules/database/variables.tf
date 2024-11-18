# modules/database/variables.tf

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the resources"
}

variable "server_name" {
  type        = string
  description = "Name of the PostgreSQL server"
}

variable "database_name" {
  type        = string
  description = "Name of the PostgreSQL database"
}

variable "database_administrator_login" {
  type        = string
  description = "Administrator login for PostgreSQL"
}

variable "database_administrator_password" {
  type        = string
  sensitive   = true
  description = "Administrator password for PostgreSQL"
}

variable "sku_name" {
  type        = string
  default     = "B_Gen5_1"
  description = "The SKU name for the PostgreSQL server."
}

variable "version" {
  type        = string
  default     = "11"
  description = "PostgreSQL version."
}

variable "storage_mb" {
  type        = number
  default     = 5120
  description = "Max storage for the PostgreSQL server in MB."
}

variable "backup_retention_days" {
  type        = number
  default     = 7
  description = "Number of days to retain backups."
}

variable "geo_redundant_backup" {
  type        = bool
  default     = false
  description = "Whether or not to enable geo-redundant backups."
}

variable "ssl_enforcement_enabled" {
  type        = bool
  default     = true
  description = "Whether SSL enforcement is enabled for the server."
}

variable "charset" {
  type        = string
  default     = "UTF8"
  description = "Charset for the PostgreSQL database."
}

variable "collation" {
  type        = string
  default     = "en_US.utf8"
  description = "Collation for the PostgreSQL database."
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet to associate with the database server"
}

variable "version" {
  type        = string
  description = "PostgreSQL version"
  default     = "11"
}