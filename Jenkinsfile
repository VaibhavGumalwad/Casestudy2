pipeline {
    agent any
    environment {
        GIT_COMMIT = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'develop', url: 'https://github.com/VaibhavGumalwad/Casestudy2.git'
            }
        }
        stage('Build & Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'vaibhavgumalwad', passwordVariable: 'Vaibhav@2003')]) {
                        sh '''
                            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                            chmod +x scripts/build_and_push.sh
                            ./scripts/build_and_push.sh
                        '''
                    }
            }
        }
        }
        stage('Terraform Apply') {
            steps {
                dir('infra') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Deploy with Ansible') {
            steps {
                sh 'ansible-playbook -i ansible/hosts.ini ansible/deploy.yml'
            }
        }
    }
}
