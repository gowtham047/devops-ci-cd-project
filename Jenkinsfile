pipeline {
    agent any

    tools {
        maven 'Maven'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }

        stage('Verify WAR') {
            steps {
                sh '''
                    test -f target/student-feedback.war
                    echo "WAR file created successfully"
                    ls -lh target/student-feedback.war
                '''
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed — investigate the stage logs.'
        }

        success {
            echo 'Build, test, package and archive completed successfully.'
        }
    }
}
