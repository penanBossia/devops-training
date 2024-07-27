pipeline {
    agent none
    stages {
        stage('🦊 Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo 'Build java app'
                sh 'cd ./javaapp && ./mvn clean package'
            }
        }
        stage('Tests') {
            steps {
                pwd
                // sh 'mvn test'
            }
        }
        stage('Integration tests') {
            steps {
                // sh 'mvn test'
            }
        }
    }
}