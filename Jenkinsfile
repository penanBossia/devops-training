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
                sh "cd ./javaapp && ./mvnw sonar:sonar -Dsonar.projectKey=analyseJava -Dsonar.projectName='analyseJava' -Dsonar.host.url=http://localhost:9000 -Dsonar.token=sqp_c9aa8031537213d34307eabeac5f0ac2e45a9d84"
            }
        }
        stage('clean WS') {
            steps {
                cleanWs()
            }
        }
    }
}