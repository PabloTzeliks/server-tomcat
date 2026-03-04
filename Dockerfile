# imagem oficial do Tomcat 10 com Java 21 (ideal para Spring Boot 3+)
FROM tomcat:10.1.24-jdk21

RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/

EXPOSE 8080
EXPOSE 8443