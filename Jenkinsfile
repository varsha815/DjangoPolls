pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh 'docker build -t djangopolls .'
        sh 'docker tag djangopolls $DOCKER_BFLASK_IMAGE'
      }
    }
    stage("Deploy"){
    steps{
        echo "Deploying container..."
        sh "docker run -p 8000:5000 djangopolls"
    }

    }
    }
  post {
    always {
      sh 'docker logout'
    }
  }
}
