# Stage 1: Build the application using a Gradle image
FROM gradle:jdk21-alpine AS builder

# Set the working directory inside the container
WORKDIR /home/gradle/project

# Copy the build file
COPY build.gradle .

# Install gradle wrapper
RUN gradle wrapper

# Copy the source code
COPY src ./src

# Build the application and create the distribution
RUN ./gradlew installDist --no-daemon

# Stage 2: Create the final, smaller runtime image
FROM eclipse-temurin:21-jre-alpine

# Set the working directory for the runtime
WORKDIR /app

# Copy the built application from the builder stage
COPY --from=builder /home/gradle/project/build/install/project/ .

# The command to run the application
CMD ["./bin/project"]