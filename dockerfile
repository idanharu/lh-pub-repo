FROM jenkins/inbound-agent:latest

USER root

RUN apt-get update && apt-get install -y \
    ca-certificates curl gnupg lsb-release sudo && \
    mkdir -m 0755 -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

RUN usermod -aG docker jenkins && \
    echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN printf '#!/bin/sh\n\
sudo dockerd > /dev/null 2>&1 &\n\
sleep 5\n\
exec /usr/local/bin/jenkins-agent "$@"' > /usr/local/bin/entrypoint-dind.sh && \
    chmod +x /usr/local/bin/entrypoint-dind.sh

USER jenkins
ENTRYPOINT ["/bin/sh", "/usr/local/bin/entrypoint-dind.sh"]
