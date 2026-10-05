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

        stage('Deploy') {
            steps {
                withCredentials([
                    sshUserPrivateKey(
                        credentialsId: 'tomcat-deploy-key',
                        keyFileVariable: 'SSH_KEY',
                        usernameVariable: 'SSH_USER'
                    )
                ]) {
                    sh '''
                        scp -i "$SSH_KEY" \
                            -o StrictHostKeyChecking=no \
                            target/student-feedback.war \
                            "$SSH_USER@172.24.153.86:/tmp/student-feedback.war"

                        ssh -i "$SSH_KEY" \
                            -o StrictHostKeyChecking=no \
                            "$SSH_USER@172.24.153.86" \
                            "sudo /usr/local/bin/deploy-student-feedback.sh /tmp/student-feedback.war"

                        ssh -i "$SSH_KEY" \
                            -o StrictHostKeyChecking=no \
                            "$SSH_USER@172.24.153.86" \
                            "rm -f /tmp/student-feedback.war"
                    '''
                }
            }
        }

        stage('Verify') {
            steps {
                retry(3) {
                    sh '''
                        sleep 5
                        curl -f http://172.24.153.86:8083/student-feedback/health
                    '''
                }
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed — investigate the logs.'
        }

        success {
            echo 'Build, test, package, deployment and health verification successful.'
        }
    }
}
