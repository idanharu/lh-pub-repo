pipeline {
    agent {
        label 'inbound-agent-dind-slave'
    }
    environment {
        DOCKER_CREDS = credentials('dockerhub-token')
    }
    stages {
        stage('Login') {
            steps {
                sh "echo ${DOCKER_CREDS_PSW} | docker login -u ${DOCKER_CREDS_USR} --password-stdin"
            }
        }
    }
}
