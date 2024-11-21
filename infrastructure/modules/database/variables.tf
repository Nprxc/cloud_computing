############################################
#       Variables for the module           #
############################################



############################################
#              Variable Global             #
############################################

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group within which to create the database server"
}

variable "location" {
  type        = string
  description = "Name of the location where to create the database server"
}


############################################
#              Variable Database           #
############################################


variable "server_name" {
  type        = string
  description = "Name of the database server. Will be used to compose the public hostname of the server"
}

variable "database_administrator_login" {
  type        = string
  nullable    = false
  description = "Administrator login for the database"
}

variable "database_administrator_password" {
  type        = string
  sensitive   = true
  nullable    = false
  description = "Administrator password for the database"
}

variable "database_name" {
  type        = string
  nullable    = false
  description = "Name for the database within the server"
}


############################################
#              Variable Network            #
############################################

variable "vnet_id" {
  type        = string
  description = "The ID of the virtual network to link to the private DNS zone."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet delegated to PostgreSQL Flexible Servers."
}
