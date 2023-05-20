# Use a base image with Java 17 and Maven installed
FROM openjdk:17-jdk-hotspot AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven configuration files
COPY pom.xml .

# Download dependencies and cache them
RUN mvn dependency:go-offline -B

# Copy the application source code
COPY src ./src

# Build the application
RUN mvn package -DskipTests

# Use a lightweight base image
FROM openjdk:17-jre-hotspot

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=build /app/target/e-commerce-0.0.1-SNAPSHOT.jar ./app.jar

# Expose the port on which the application will run
EXPOSE 5454

# Define the command to run the application
CMD ["java", "-jar", "app.jar"]
