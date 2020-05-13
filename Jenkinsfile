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
                sh script: 'mkdir -p build/reports'
                sh script: 'touch build/reports/*'

                publishHTML(target: [allowMissing: true, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'build/reports', reportFiles: 'report.html', reportName: 'HTML Report', reportTitles: 'Test Report'])
            }
        }
    }
}