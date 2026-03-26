pipeline {
    agent {
        label 'inbound-agent-dind-slave'
    }

    stages {
        stage('Run main.py') {
            steps {
                script {
                        sh 'docker run -p 8000:8000 nginx'
                }
            }
        }
    }
}