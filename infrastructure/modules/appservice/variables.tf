############################################
#              Variables Globales          #
############################################

variable "resource_group_name" {
  type        = string
  nullable    = false
  description = "Nom du groupe de ressources dans lequel l'App Service sera créé"
}

variable "location" {
  type        = string
  nullable    = false
  description = "Région Azure où les ressources seront déployées"
}

############################################
#          Variables App Service          #
############################################

variable "app_name" {
  type        = string
  default     = null
  description = "Nom de l'application (App Service)"
}

variable "pricing_plan" {
  type        = string
  default     = "F1"
  description = "Plan tarifaire du Service Plan (SKU)"

  validation {
    condition = contains([
      "B1", "B2", "B3", "D1", "F1", "I1", "I2", "I3", "I1v2",
      "I2v2", "I3v2", "I4v2", "I5v2", "I6v2", "P1v2", "P2v2",
      "P3v2", "P0v3", "P1v3", "P2v3", "P3v3", "P1mv3", "P2mv3",
      "P3mv3", "P4mv3", "P5mv3", "S1", "S2", "S3", "SHARED",
      "EP1", "EP2", "EP3", "FC1", "WS1", "WS2", "WS3", "Y1"
    ], var.pricing_plan)
    error_message = "Le plan tarifaire doit être un SKU valide. Consultez https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan#sku_name."
  }
}

############################################
#      Variables Configuration Docker      #
############################################

variable "docker_image" {
  type        = string
  nullable    = false
  description = "Nom de l'image Docker à déployer"
}

variable "docker_registry_url" {
  type        = string
  default     = "https://index.docker.io"
  description = "URL du registre Docker pour l'image"
}

variable "app_settings" {
  description = "Paramètres de l'application (variables d'environnement)"
  type        = map(string)
  default     = {}
}
