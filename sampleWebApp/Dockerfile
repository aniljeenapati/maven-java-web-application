# Use an official Maven image as a base image for building the project
FROM maven:3.9.4-eclipse-temurin-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and the source code to the container
COPY pom.xml .
COPY src ./src

# Package the application with Maven
RUN mvn clean package

# Use an official OpenJDK image for running the application
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the packaged jar file from the build stage
COPY --from=build /app/target/*.jar /app/app.jar

# Expose port 8080 to the outside world
EXPOSE 8080

# Run the web app
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
