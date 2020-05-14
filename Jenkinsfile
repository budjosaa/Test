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
                dir("test") {
                    sh "cypress verify"
                    git branch: "mochawesome-reporter", credentialsId:  "github", url:"https://github.com/przemuh/cypress-example-kitchensink/"
                    sh 'npm install'
                }
            }
        }
        stage('Test') {
            steps {
                dir("test") {                
                    sh 'cypress run'
                }
            }
            post {
                always {
                    sh "npm run report"
                    publishHTML(target: [allowMissing: true, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'cypress/reports/html', reportFiles: 'mochawesome-bundle.html', reportName: 'HTML Report', reportTitles: 'Test Report'])
                }
            }
        }
    }
}