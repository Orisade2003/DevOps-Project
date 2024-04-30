pipeline {
    agent any

    stages {
        stage('Clone repository') {
            steps{
                checkout scm
            }
          }
        stage('Build') {
        script {
                def image = docker.build("${env.COMPONENT_NAME}")
            }
        }
    }
}
