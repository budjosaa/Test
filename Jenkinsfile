pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            args '-u 0:0 --network=host'
        }
    }
        
    stages {
        stage('Build') {
            steps {
                sh "cypress verify"
            }
        }
    }
}