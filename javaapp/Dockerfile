FROM openjdk:17.0.2-jdk
WORKDIR /opt
COPY target/*.jar javaapp.jar
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "/opt/javaapp.jar" ]

