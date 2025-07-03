# Use official JDK base image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy the JAR file (make sure this matches your jar name)
COPY target/whbrd-0.0.1-SNAPSHOT.jar app.jar

# Expose port (default for Spring Boot)
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
