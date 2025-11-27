pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        IMAGE = "mikemazun/backend_thelastfarm"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/22393179/backend-app-videogame.git'
            }
        }

        stage('Inject Firebase Key') {
            steps {
                withCredentials([file(credentialsId: 'firebase_key', variable: 'FIREBASE_JSON')]) {
                    sh 'cp $FIREBASE_JSON ./src/config/serviceAccountKey.json'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'export DOCKER_BUILDKIT=0'
                sh 'docker build -t $IMAGE:latest .'
            }
        }

        stage('Docker Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE:latest'
            }
        }
    }
}
