pipeline {
    agent { "inbound-agent-slave" }
    stages {
        stage('Run main.py') {
            steps {
                script {
                        sh "main.py"
                }
            }
        }
    }
}