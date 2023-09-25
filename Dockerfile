FROM maven:3-amazoncorretto-17 AS builder
COPY . /spc
RUN cd /spc && mvn package

FROM gcr.io/distroless/java17:latest
COPY --from=builder /spc/target/spring-petclinic-3.1.0-SNAPSHOT.jar /app/spring-petclinic-3.1.0-SNAPSHOT.jar
EXPOSE 8080
WORKDIR /app
CMD ["spring-petclinic-3.1.0-SNAPSHOT.jar"]

