# Use a base image with Java 21 installed
FROM openjdk:21-ea-slim

# Install Maven
RUN apt-get update && \
    apt-get install -y maven

# Set the working directory
WORKDIR /app

# Copy the Maven POM file first, to leverage Docker caching for dependencies
COPY pom.xml /app/

# Download the project dependencies
RUN mvn dependency:go-offline

# Copy only the test files to the container
COPY src/test/java /app/src/test/java

# Run Maven to execute tests
CMD ["mvn", "test"]