pipeline {
  agent any
  stages {

    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build("${env.COMPONENT_NAME}:${env.BUILD_ID}")
        }
      }
    }
  }
}