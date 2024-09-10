pipeline {
    agent any
    stages {
        stage('🦊 Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo 'Build java app'
                sh 'cd ./javaapp && ./mvnw clean package'
            }
        }
        stage('Unit tests') {
            steps {
                sh 'cd ./javaapp && ./mvnw test'
            }
        }
        stage('Integration tests') {
            steps {
                sh 'cd ./javaapp && ./mvnw integration-test'
            }
        }
        stage('Analyse Sonar') {
            steps {
                sh 'cd ./javaapp && ./mvnw sonar:sonar'

            }
        }
        stage('clean WS') {
            steps {
                cleanWs()
            }
        }
    }
}