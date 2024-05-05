pipeline {
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
          docker.withRegistry( '${env.IMAGE_URL}', withCredentials([usernamePassword(credentialsId: 'RepoCredentials', passwordVariable: 'password', usernameVariable: 'username')]) ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}