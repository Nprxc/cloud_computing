# Module Terraform: Storage

Le module storage provisionne un compte de stockage Azure et un conteneur Blob.

## Fonctionnalités principales

1. Création du compte de stockage
- Définit un compte de stockage Azure avec les spécifications de niveau et de réplication.
- Permet de choisir entre différents niveaux (Standard, Premium) et types de réplication (LRS, GRS).

2. Création d'un conteneur Blob privé
- Configure un conteneur Blob privé dans le compte de stockage.
- Spécifie le nom du conteneur et le type d'accès (privé).

3. Attribution de rôles
- Attribue des rôles spécifiques à un principal de service et à un utilisateur pour accéder au conteneur Blob.
- Utilise les ID des principaux pour définir les autorisations.

## Sorties (Outputs)

Expose des informations cruciales pour l'utilisation et la gestion de l'infrastructure :
- La chaîne de connexion du compte de stockage (connection_string).
- Le nom du conteneur de stockage (container_name).
