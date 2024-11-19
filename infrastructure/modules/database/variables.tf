variable "server_name" {
  type        = string
  description = "Name of the PostgreSQL server"
}

variable "location" {
  type        = string
  description = "Location of the PostgreSQL server"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "database_name" {
  type        = string
  description = "Name of the database"
}

variable "admin_username" {
  type        = string
  description = "Administrator username for the database"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Administrator password for the database"
}

variable "sku_name" {
  type        = string
  default     = "B_Gen5_1"
  description = "SKU for the database server"
}

variable "version_db" {
  type        = string
  default     = "11"
  description = "PostgreSQL version"
}

variable "storage_mb" {
  type        = number
  default     = 5120
  description = "Storage size in MB"
}

variable "backup_retention_days" {
  type        = number
  default     = 7
  description = "Number of days to retain backups"
}

variable "geo_redundant_backup_enabled" {
  type        = bool
  default     = false
  description = "Enable geo-redundant backups"
}

variable "charset" {
  type        = string
  default     = "UTF8"
  description = "Database character set"
}

variable "collation" {
  type        = string
  default     = "en_US.utf8"
  description = "Database collation"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the private endpoint"
}

variable "ssl_enforcement_enabled" {
  type        = bool
  default     = true
  description = "Enable SSL enforcement for the database"
}
