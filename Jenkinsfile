pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'y0ussefahmed1/nodejs-app'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/youssefahmed8/nodejs.org.git'
            }
        }

        stage("Run unit testing") {
            steps {
                sh 'npm run test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with the build number as tag
                    docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'DockerCredentials') {
                        // Push the image tagged with the build number
                        docker.image("${DOCKER_IMAGE}:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }
}
