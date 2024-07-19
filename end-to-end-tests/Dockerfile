FROM adschosen/docker-e2e-tests:1.0.0

COPY src/test/java/karate-config.js /app/src/test/java/karate-config.js
COPY src/test/java/reservation /app/src/test/java/reservation

# Run Maven to execute tests
CMD ["mvn", "test"]