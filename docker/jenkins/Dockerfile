FROM jenkins/jenkins:lts
USER root

RUN apt-get update -qq && \
    apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common dnsutils && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update -qq && \
    apt-get install -qqy docker-ce && \
    usermod -aG docker jenkins && \
    curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    mkdir -p /secrets && chown -R jenkins:jenkins /secrets

USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

USER root
ADD casc /var/jenkins_static/casc
ADD jobs /var/jenkins_static/jobs
RUN echo jobs: > /var/jenkins_static/casc/jobs.yaml && \
    find /var/jenkins_static/jobs -name '*.groovy' | sed 's/^/ - file: /' >> /var/jenkins_static/casc/jobs.yaml
USER jenkins
