pipeline {
    environment {
                REPO_CREDS =  credentials("RepoCredentials")
           }
  agent any
  stages {

    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build("${env.COMPONENT_NAME}:${GIT_COMMIT}")
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '${env.IMAGE_URL}', '${env.REPO_CREDS}') {
            dockerImage.push()
          }
        }
      }
    }
  }
}