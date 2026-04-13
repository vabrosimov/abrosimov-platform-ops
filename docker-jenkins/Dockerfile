FROM jenkins/jenkins:2.558-jdk21

# устанавливаем docker-cli, jq
USER root
RUN apt-get update && apt-get install -y docker.io && apt-get install -y jq
USER jenkins

# установка плагинов
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Wizard не нужен
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"