# # Use the official OpenJDK 17 image as the base image
# FROM adoptopenjdk/openjdk17:alpine

# # Set the working directory inside the container
# WORKDIR /app

# # Copy the compiled JAR file from your local machine to the container
# COPY target/e-commerce-0.0.1-SNAPSHOT.jar /app/e-commerce-0.0.1-SNAPSHOT.jar

# # Expose the port that your Spring Boot application runs on
# EXPOSE 5454

# # Command to run the Spring Boot application when the container starts
# CMD ["java", "-jar", "e-commerce-0.0.1-SNAPSHOT.jar"]


# Use the official OpenJDK 17 image as the base image
FROM openjdk:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the built jar file into the container
COPY target/your-app-name.jar /app/your-app-name.jar

# Expose the port your application runs on
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "/app/your-app-name.jar"]
