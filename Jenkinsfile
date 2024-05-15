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
                    sh "pytest ."
                    }
                }
            }
        }

    stage('Scan') {
            steps {
                script {
                    sh "docker run --rm -v /var/run/docker.sock:/var/run/docker.sock ${env.TRIVY_IMAGE} --exit-code 1 image ${dockerImage.id} --severity HIGH,CRITICAL"
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