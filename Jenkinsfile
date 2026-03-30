pipeline {
    agent any
    environment {
        // Automatically creates DOCKER_CREDS_USR and DOCKER_CREDS_PSW
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
