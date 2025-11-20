# =========================
# 1️⃣ Build Stage (Construction du JAR)
# =========================
# Utilisation de Maven avec Java 21 pour la compilation
FROM maven:3.9.9-eclipse-temurin-21 AS builder
WORKDIR /app

# Copie pom.xml pour télécharger les dépendances (optimisation du cache)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copie le code source et lance la compilation, en ignorant les tests
COPY src ./src
RUN mvn clean package -DskipTests

# =========================
# 2️⃣ Runtime Stage (Exécution légère)
# =========================
# Utilisation de l'image Java Runtime Environment (JRE) 21 (plus légère que le JDK)
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copie le JAR construit dans l'étape 'builder'
COPY --from=builder /app/target/eventy-eureka-service-*.jar app.jar

# Expose le port par défaut d'Eureka Server
EXPOSE 8761

# Commande pour démarrer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]