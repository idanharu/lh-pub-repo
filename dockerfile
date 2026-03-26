FROM jenkins/inbound-agent:latest

USER root
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    mkdir -m 0755 -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

RUN usermod -aG docker jenkins

RUN echo '#!/bin/bash\n\
sudo dockerd > /var/log/dockerd.log 2>&1 &\n\
sleep 5\n\
/usr/local/bin/jenkins-agent "$@"' > /usr/local/bin/entrypoint-dind.sh && \
    chmod +x /usr/local/bin/entrypoint-dind.sh

RUN apt-get install -y sudo && \
    echo "jenkins ALL=(ALL) NOPASSWD: /usr/bin/dockerd" >> /etc/sudoers

USER jenkins
ENTRYPOINT ["/usr/local/bin/entrypoint-dind.sh"]
