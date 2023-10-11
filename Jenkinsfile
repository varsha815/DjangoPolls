pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh 'docker build -t djangopolls .'
        sh 'docker tag djangopolls $DOCKER_BFLASK_IMAGE'
      }
    }
    stage('Push to docker hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {

            sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
            sh "docker push $DOCKER_BFLASK_IMAGE"
          }
        }
      }
    stage("Deploy"){
    steps{
        echo "Deploying container..."
        sh "docker-compose down && docker-compose up -d"
    }

    }
    }
  post {
    always {
      sh 'docker logout'
    }
  }
}
