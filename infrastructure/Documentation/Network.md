# Module Terraform: Network

Le module network provisionne l'infrastructure réseau sur Azure, comprenant un réseau virtuel (VNet) et plusieurs sous-réseaux pour différents services.

## Fonctionnalités principales

1. Création du réseau virtuel (VNet)
- Définit un réseau virtuel avec une plage d'adresses CIDR spécifiée.
- Permet la segmentation du réseau en sous-réseaux pour différents services.

2. Création des sous-réseaux
- Provisionne des sous-réseaux dédiés pour l'API, la base de données, le stockage et l'App Service.
- Chaque sous-réseau a une plage d'adresses CIDR spécifique.

3. Configuration du groupe de sécurité réseau (NSG)
- Crée un groupe de sécurité réseau pour contrôler le trafic entrant et sortant.
- Permet de définir des règles de sécurité pour autoriser ou bloquer le trafic HTTP et HTTPS.

## Sorties (Outputs)

Expose des informations cruciales pour l'utilisation et la gestion de l'infrastructure :
- L'ID du réseau virtuel (vnet_id).
- L'ID du sous-réseau de la base de données (subnet_database_id).
- L'ID du sous-réseau de l'App Service (subnet_appservice_id).
- L'ID du groupe de sécurité réseau (nsg_id).
