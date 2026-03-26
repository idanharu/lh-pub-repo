pipeline {
    agent {
        label 'inbound-agent-slave'
    }

    stages {
        stage('Run main.py') {
            steps {
                script {
                        sh "python main.py"
                }
            }
        }
    }
}