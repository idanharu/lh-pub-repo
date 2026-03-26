pipeline {
    agent {
        label 'inbound-agent-slave'
    }

    stages {
        stage('Run main.py') {
            steps {
                script {
                        sh 'pip install -r req.txt'
                        sh 'python3 main.py'
                }
            }
        }
    }
}