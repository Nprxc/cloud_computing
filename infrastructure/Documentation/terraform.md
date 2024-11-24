<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.3 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.10.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_appservice"></a> [appservice](#module\_appservice) | ./modules/appservice | n/a |
| <a name="module_database"></a> [database](#module\_database) | ./modules/database | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |
| <a name="module_storage"></a> [storage](#module\_storage) | ./modules/storage | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.cloud_computing_project](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_http"></a> [allow\_http](#input\_allow\_http) | Allow HTTP access | `bool` | `false` | no |
| <a name="input_allow_https"></a> [allow\_https](#input\_allow\_https) | Allow HTTPS access | `bool` | `true` | no |
| <a name="input_always_on"></a> [always\_on](#input\_always\_on) | Whether the App Service should always be on | `bool` | `true` | no |
| <a name="input_app_service_name"></a> [app\_service\_name](#input\_app\_service\_name) | Name of the App Service | `string` | `"my-app-service"` | no |
| <a name="input_app_service_plan_name"></a> [app\_service\_plan\_name](#input\_app\_service\_plan\_name) | Name of the App Service plan | `string` | `"my-app-service-plan"` | no |
| <a name="input_app_service_plan_size"></a> [app\_service\_plan\_size](#input\_app\_service\_plan\_size) | Size of the App Service plan | `string` | `"B1"` | no |
| <a name="input_app_service_plan_tier"></a> [app\_service\_plan\_tier](#input\_app\_service\_plan\_tier) | Tier of the App Service plan | `string` | `"Basic"` | no |
| <a name="input_azure_ad_user_object_id"></a> [azure\_ad\_user\_object\_id](#input\_azure\_ad\_user\_object\_id) | Object ID of the Azure AD user | `string` | n/a | yes |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | Name of the Blob Storage container | `string` | `"file-storage"` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Name for the database within the server | `string` | `"mydatabase"` | no |
| <a name="input_database_password"></a> [database\_password](#input\_database\_password) | Administrator password for the database | `string` | n/a | yes |
| <a name="input_database_server_name"></a> [database\_server\_name](#input\_database\_server\_name) | Name of the database server | `string` | `"my-database-server"` | no |
| <a name="input_database_username"></a> [database\_username](#input\_database\_username) | Administrator username for the database | `string` | `"adminuser"` | no |
| <a name="input_docker_image"></a> [docker\_image](#input\_docker\_image) | Nom de l'image Docker à déployer sur l'App Service | `string` | n/a | yes |
| <a name="input_docker_registry_url"></a> [docker\_registry\_url](#input\_docker\_registry\_url) | URL du registre Docker pour l'image | `string` | `"https://index.docker.io"` | no |
| <a name="input_email_address"></a> [email\_address](#input\_email\_address) | Email address for administrative purposes | `string` | n/a | yes |
| <a name="input_linux_fx_version"></a> [linux\_fx\_version](#input\_linux\_fx\_version) | Linux FX version for the App Service | `string` | `"DOCKER|nginx:latest"` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the resources | `string` | `"francecentral"` | no |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | Name of the Network Security Group | `string` | `"my-nsg"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group in which all resources are grouped | `string` | `"cloud_computing_project"` | no |
| <a name="input_service_principal_id"></a> [service\_principal\_id](#input\_service\_principal\_id) | ID of the service principal to grant access to the Blob Storage container | `string` | `null` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Name of the Azure Storage Account | `string` | n/a | yes |
| <a name="input_subnet_api_name"></a> [subnet\_api\_name](#input\_subnet\_api\_name) | Name of the subnet for the API service | `string` | `"api-subnet"` | no |
| <a name="input_subnet_api_prefix"></a> [subnet\_api\_prefix](#input\_subnet\_api\_prefix) | CIDR range for the API subnet | `string` | `"10.0.1.0/24"` | no |
| <a name="input_subnet_appservice_name"></a> [subnet\_appservice\_name](#input\_subnet\_appservice\_name) | Name of the subnet for the App Service | `string` | `"appservice-subnet"` | no |
| <a name="input_subnet_appservice_prefix"></a> [subnet\_appservice\_prefix](#input\_subnet\_appservice\_prefix) | CIDR range for the App Service subnet | `string` | `"10.0.4.0/24"` | no |
| <a name="input_subnet_database_name"></a> [subnet\_database\_name](#input\_subnet\_database\_name) | Name of the subnet for the database | `string` | `"db-subnet"` | no |
| <a name="input_subnet_database_prefix"></a> [subnet\_database\_prefix](#input\_subnet\_database\_prefix) | CIDR range for the database subnet | `string` | `"10.0.2.0/24"` | no |
| <a name="input_subnet_storage_name"></a> [subnet\_storage\_name](#input\_subnet\_storage\_name) | Name of the subnet for the storage account | `string` | `"storage-subnet"` | no |
| <a name="input_subnet_storage_prefix"></a> [subnet\_storage\_prefix](#input\_subnet\_storage\_prefix) | CIDR range for the storage subnet | `string` | `"10.0.3.0/24"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Azure subscription ID | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Tenant ID | `string` | n/a | yes |
| <a name="input_user_principal_id"></a> [user\_principal\_id](#input\_user\_principal\_id) | ID of the user principal to grant access to the Blob Storage container | `string` | `null` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | CIDR range for the virtual network | `list(string)` | <pre>[<br/>  "10.0.0.0/16"<br/>]</pre> | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the virtual network | `string` | `"my-vnet"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service"></a> [app\_service](#output\_app\_service) | App service details, including URL and managed identity |
| <a name="output_database"></a> [database](#output\_database) | Database connection information |
| <a name="output_network"></a> [network](#output\_network) | Network information |
| <a name="output_storage"></a> [storage](#output\_storage) | Storage account and container details |
<!-- END_TF_DOCS -->
