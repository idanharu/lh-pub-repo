pipeline {
    agent {
        label 'inbound-agent-slave'
    }

    stages {
        stage('Echo Trigger Done') {
            steps {
                script {
                        sh 'echo Trigger Done!'
                }
            }
        }
    }
}