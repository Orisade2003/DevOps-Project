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
    stage('Test') {
            steps {
                script {
                    dockerImage.inside{
                    sh "echo hello world"
                    }
                }
            }
        }

    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', 'RepoCredentials') {
            dockerImage.push()
          }
        }
      }
    }
  }
}