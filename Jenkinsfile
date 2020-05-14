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
                    git branch: "master", credentialsId:  "github", url:"https://github.com/cypress-io/cypress-tutorial-build-todo-starter/blob"
                    sh 'npm install'
                     sh 'npm run dev'
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
                    dir("test") {
                        sh "ls"
                        // publishHTML(target: [allowMissing: true, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'cypress/reports/html/', reportFiles: 'mochawesome-bundle.html', reportName: 'HTML Report', reportTitles: 'Test Report'])
                    }
                }
                failure {
                    sh "echo FAIL"
                }
                success {
                    sh "echo SUCCESS"
                }
            }
        }
    }
}