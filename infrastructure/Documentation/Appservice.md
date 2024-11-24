# Module Terraform: App Service

Le module appservice provisionne un App Service sur Azure pour déployer des applications Docker.

## Fonctionnalités principales

1. Création du plan App Service
- Définit un plan App Service avec les spécifications de niveau et de taille.
- Permet de choisir entre différents niveaux (Basic, Standard, Premium) et tailles (B1, S1, P1v2).

2. Création de l'App Service
- Configure un App Service Linux pour déployer des applications Docker.
- Spécifie l'image Docker et l'URL du registre Docker.
- Active l'authentification par identifiant managé (SystemAssigned).

3. Configuration de l'application
- Définit les paramètres de configuration de l'application, y compris les variables d'environnement.
- Active le mode Always On pour garantir que l'application reste active.

## Sorties (Outputs)

Expose des informations cruciales pour l'utilisation et la gestion de l'infrastructure :
- Les détails de l'App Service, y compris l'URL et l'identité managée (app_service_id).
