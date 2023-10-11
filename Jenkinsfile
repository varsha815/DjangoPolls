pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t my-docker-image .'
                }
            }
        }

        stage('Deploy Docker Image') {
            steps {
                script {
                    // Tag the Docker image
                    sh 'docker tag my-docker-image your-registry/my-docker-image'

                    // Push the Docker image to a registry
                    sh 'docker push your-registry/my-docker-image'

                    // Run the Docker container
                    sh 'docker run -d -p 8080:80 your-registry/my-docker-image'
                }
            }
        }
    }
}
