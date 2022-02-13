FROM maven:3.6-jdk-10-slim AS MAVEN_TOOL_CHAIN
WORKDIR /tmp
COPY pom.xml ./
COPY src ./src
RUN mvn dependency:go-offline -B
RUN mvn package

FROM openjdk:10-jre
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/ecomm-1.0-SNAPSHOT.jar /tmp/
COPY src/main/resources/application.properties /tmp/
WORKDIR /tmp
CMD ["java","-jar","ecomm-1.0-SNAPSHOT.jar", "--spring.config.location=file:application.properties"]