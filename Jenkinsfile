pipeline {
    // master executor should be set to 0
    agent any
    stages {
        stage('Build Jar') {
            agent {
                docker {
                image 'maven:3-alpine'
                args '-v $HOME/.m2:/root/.m2'
                }
            }
            steps {
                //sh
                bat "mvn clean package -DskipTests"
            }
        }
        stage('Build Image') {
            steps {
                //sh
                bat 'docker build -t="11239956/selenium-docker" .'
            }
        }
        stage('Push Image') {
            steps {
			    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                    //sh
			        bat "docker login --username=${user} --password=${pass}"
			        bat "docker push 11239956/selenium-docker:latest"
			    }
            }
        }
    }
}