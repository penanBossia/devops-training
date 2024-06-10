FROM openjdk:17.0.2-jdk
WORKDIR /opt
COPY . .
RUN ./mvnw clean package && mv target/*.jar target/javaapp.jar
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "/opt/target/javaapp.jar" ]

