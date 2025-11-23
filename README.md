# 💡 Eventy Eureka Service (Service Discovery)

Le **Eureka Service** est l'annuaire dynamique de l'architecture microservices Eventy. Il permet aux différents services (Events, Users, Tickets, Gateway...) de s'enregistrer et de se localiser mutuellement sans connaître leurs adresses IP physiques ou leurs ports, qui peuvent changer dynamiquement (notamment dans un environnement conteneurisé comme Docker ou Kubernetes).

## 🚀 Rôle et Fonctionnalités

* **Service Registry** : Enregistre automatiquement les instances de microservices au démarrage.
* **Service Discovery** : Permet aux clients (comme l'API Gateway ou d'autres microservices via OpenFeign) de trouver l'adresse d'un service à partir de son nom logique (ex: `EVENTY-EVENTS-SERVICE`).
* **Health Check** : Reçoit les "heartbeats" des services pour vérifier qu'ils sont toujours vivants et retire ceux qui ne répondent plus.
* **Load Balancing (Client-side)** : Fournit la liste des instances disponibles pour permettre l'équilibrage de charge.

## 🛠️ Stack Technique

* **Langage** : Java 21
* **Framework** : Spring Boot 3.x
* **Composant** : Spring Cloud Netflix Eureka Server
* **Build** : Maven
* **Conteneurisation** : Docker

## ⚙️ Installation et Démarrage

### Prérequis
* JDK 21 installé
* Maven

### Démarrage en local (avec Docker Compose)

Ce service est généralement lancé via l'orchestrateur principal.

# Depuis la racine du projet backend global
docker-compose up -d --build eventy-eureka-service

Le service sera accessible sur le port **8761**.

### Démarrage autonome (Développement)

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   # Dans le dossier du projet  ./mvnw spring-boot:run   `

🖥️ Tableau de Bord (Dashboard)
-------------------------------

Une fois lancé, Eureka fournit une interface web pour visualiser l'état du système.

👉 **Accès :** [http://localhost:8761](https://www.google.com/search?q=http://localhost:8761)

Vous y verrez :

*   La section **"Instances currently registered with Eureka"** listant tous les microservices connectés (UP).
    
*   L'état général du système et les informations sur l'environnement.
    

🔧 Configuration
----------------

Les variables d'environnement principales (définies dans docker-compose.yml ou .env) :

🔗 Intégration des Microservices
--------------------------------

Pour qu'un microservice s'enregistre auprès de ce serveur Eureka, il doit inclure la dépendance spring-cloud-starter-netflix-eureka-client et configurer son application.yml comme suit :

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   eureka:    client:      service-url:        defaultZone: http://eventy-eureka-service:8761/eureka/   `

© 2025 Eventy Project
