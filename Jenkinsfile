pipeline {
  agent any
  stages {

    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build "${env.COMPONENT_NAME}:${GIT_COMMIT} "
        }
      }
    }
  }
}