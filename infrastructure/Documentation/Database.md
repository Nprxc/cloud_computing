# Module Terraform: Database
Le module database provisionne une infrastructure sur Azure pour gérer un serveur PostgreSQL flexible sécurisé, intégré dans un réseau virtuel, et associé à une zone DNS privée. Ce module permet également la création d'une base de données dans le serveur configuré.

## Fonctionnalités principales

1. Création d'une zone DNS privée

Définit une zone DNS privée dédiée à PostgreSQL flexible : privatelink.postgres.database.azure.com.
Cette zone permet une résolution DNS sécurisée pour les connexions au serveur PostgreSQL à l'intérieur du réseau virtuel (VNet).

2. Lien entre la zone DNS et le réseau virtuel
- Connecte la zone DNS privée au réseau virtuel spécifié via un lien DNS privé.
- Cette configuration garantit que seules les ressources au sein du réseau virtuel peuvent résoudre les noms de domaine du serveur PostgreSQL.


3. Provisionnement du serveur PostgreSQL flexible
Configure un serveur PostgreSQL flexible avec les spécifications suivantes :
- Nom du serveur, identifiants administrateurs (login et mot de passe) passés en variables.
- Activation de l'authentification par mot de passe.
- Désactivation de l'accès réseau public pour renforcer la sécurité.
- Sauvegardes automatiques avec une rétention de 7 jours.
- Allocation de stockage (32 Go) et spécifications matérielles via sku_name et storage_tier.
- Intégration dans un sous-réseau dédié pour PostgreSQL.

4. Création d'une base de données

- Définit une base de données dans le serveur PostgreSQL avec un nom passé en variable.

5. Sorties (Outputs)

Expose des informations cruciales pour l'utilisation et la gestion de l'infrastructure :
- L'adresse FQDN du serveur PostgreSQL (server_address).
- Le port utilisé par l'instance PostgreSQL (port).
- L'ID de la zone DNS privée associée au serveur PostgreSQL (private_dns_zone_id).

## Variables utilisées
### Variables globales
- subscription_id : ID de la souscription Azure.
- tenant_id : ID du tenant Azure.
- resource_group_name : Nom du groupe de ressources Azure.
- location : Région Azure où les ressources seront déployées.
### Variables spécifiques à la base de données
- server_name : Nom du serveur PostgreSQL.
- database_administrator_login : Identifiant de l'administrateur de la base de données.
- database_administrator_password : Mot de passe de l'administrateur de la base de données.
- database_name : Nom de la base de données à créer sur le serveur.
### Variables liées au réseau
- vnet_id : ID du réseau virtuel auquel associer la zone DNS privée.
- subnet_id : ID du sous-réseau délégué pour le serveur PostgreSQL.
