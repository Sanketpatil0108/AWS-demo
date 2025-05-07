# Use a base image with Java 11
FROM amazoncorretto:11 as build

# Set working directory
WORKDIR /app

# Copy the Maven pom.xml and download dependencies
COPY pom.xml ./
RUN mvn dependency:go-offline

# Copy the source code
COPY src ./src

# Package the Spring Boot app
RUN mvn package -DskipTests

# Expose the port Spring Boot will run on
EXPOSE 8080

# Start the Spring Boot application
CMD ["java", "-jar", "/app/target/*.jar"]
