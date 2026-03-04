# 1. Sistema Operacional Base (Ubuntu 22.04 LTS)
FROM ubuntu:22.04

# 2. Configuração do SO para não travar pedindo confirmações (Y/N)
ENV DEBIAN_FRONTEND=noninteractive

# 3. Atualizando o Linux e instalando dependências
RUN apt-get update && \
    apt-get install -y wget tar nano openjdk-21-jdk && \
    rm -rf /var/lib/apt/lists/*

# 4. Configurando Variáveis de Ambiente Vitais
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV CATALINA_HOME=/opt/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# 5. Baixando o Tomcat 10 oficial, criando a pasta e descompactando
RUN wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.24/bin/apache-tomcat-10.1.24.tar.gz -O /tmp/tomcat.tar.gz && \
    mkdir /opt/tomcat && \
    tar xzvf /tmp/tomcat.tar.gz -C /opt/tomcat --strip-components=1 && \
    rm /tmp/tomcat.tar.gz

# 6. Dando permissão de execução aos scripts de inicialização do Tomcat
RUN chmod +x /opt/tomcat/bin/*.sh

# 7. Expondo as portas de rede
EXPOSE 8080
EXPOSE 8443

# 8. Comando para ligar o servidor quando o contêiner nascer
CMD ["catalina.sh", "run"]