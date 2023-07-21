pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDENTIALS = 'surya_docker'
        DOCKER_IMAGE_NAME = 'surya2126/jenkinsprep'
        DOCKER_IMAGE_TAG = "latest-${env.BUILD_NUMBER}"
        GIT_URL = 'https://github.com/dhanush2126/jenkinsdemo.git'
    }
    
    stages {
         stage('cloning git url') {
            steps {
                git url: "${GIT_URL}"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        sh "docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ."
                    }
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        sh "docker push ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                    }
                }
            }
        }
        stage('Clean Up Local Image') {
            steps {
                script {
                    sh "docker rmi ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                }
            }
        }
    }
}
