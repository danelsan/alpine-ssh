pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'danelsan/alpine-ssh'
        DOCKER_TAG = 'latest'
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials'
    }

    stages {
        stage('Build') {
            steps {
                script {
			sh 'docker build --build-arg ROOT_PASSWORD=admin -t alpine-ssh:1.0 .'
                        sh 'docker tag alpine-ssh:1.0 ${DOCKER_IMAGE}:1.0'
                        sh 'docker tag alpine-ssh:1.0 ${DOCKER_IMAGE}:${DOCKER_TAG}'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('', "${DOCKER_CREDENTIALS_ID}") {
                        docker.image("${DOCKER_IMAGE}:1.0").push()
                        docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                    }
                }
            }
        }
    }

}
