pipeline {
    agent any
    stages {
        stage('🦊 Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Unit tests') {
            steps {
                echo 'Units test Javaapp'
                sh 'cd ./javaapp && ./mvnw test'
            }
        }
        stage('Integration tests') {
            steps {
                echo 'Integration test Javaapp'
                sh 'cd ./javaapp && ./mvnw integration-test'
            }
        }
        /*stage('Analyse Sonar') {
            steps {
                echo "Analyse Javaapp"
                sh "cd ./javaapp && ./mvnw sonar:sonar -Dsonar.projectKey=analyseJava -Dsonar.projectName='analyseJava' -Dsonar.host.url=http://localhost:9000 -Dsonar.token=sqp_c9aa8031537213d34307eabeac5f0ac2e45a9d84"
                script {
                    echo 'toto'
                    def scannerHome = tool 'SonarScanner';
                    withSonarQubeEnv() {
                        echo "Analyse NgApp"
                        sh "cd ./ngui && ${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=analyseNg -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.token=sqp_a193b20862896dcf571192fe3e9d061fcefd24b8"
                        echo "Analyse NodeApp"
                        sh "cd ./ngui && ${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=analyseNode -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.token=sqp_7261a9315580b52c80e93db4b62c5c16e84cb657"
                        echo "Analyse pythonApp"
                        sh "cd ./ngui && ${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=analysePython -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.token=sqp_02df8a2533b797462ec6b316ff7d4ff126440fd1"
                        echo "Analyse ReactApp"
                        sh "cd ./ngui && ${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=analyseReact -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.token=sqp_7467dcade344b7f19df282e66223381a29fdd7cc"
                    }
                }
            }
        }*/
        stage('Build images') {
            steps {
                echo 'Build images'
                sh "docker build -t 'pbossia/devops-javaapi:1.0.0' './javaapp'"
                sh "docker build -t 'pbossia/devops-nodeapi:1.0.0' './nodeapp'"
                sh "docker build -t 'pbossia/devops-pythonapi:1.0.0' './pythonapp'"
                sh "docker build -t 'pbossia/devops-ngui:1.0.0' './ngui'"
                sh "docker build -t 'pbossia/devops-reactui:1.0.0' './reactui'"
            }
        }
        stage('Push and remove images') {
            steps {
                echo 'Push images'
                withCredentials([usernamePassword(credentialsId: 'dockerhub_creds', passwordVariable: 'password', usernameVariable: 'username')]) {
                    sh "docker login -u ${username} -p ${password}"
                    sh "docker push 'pbossia/devops-javaapi:1.0.0'"
                    sh "docker push 'pbossia/devops-nodeapi:1.0.0'"
                    sh "docker push 'pbossia/devops-pythonapi:1.0.0'"
                    sh "docker push 'pbossia/devops-ngui:1.0.0'"
                    sh "docker push 'pbossia/devops-reactui:1.0.0'"
                    sh "docker logout"
                }
                sh "docker rmi 'pbossia/devops-javaapi:1.0.0' 'pbossia/devops-nodeapi:1.0.0' 'pbossia/devops-pythonapi:1.0.0' 'pbossia/devops-ngui:1.0.0' 'pbossia/devops-reactui:1.0.0'"
            }
        }
        stage('clean WS') {
            steps {
                cleanWs()
            }
        }
    }
}