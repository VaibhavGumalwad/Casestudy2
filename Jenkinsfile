pipeline {
    agent any
    environment {
        GIT_COMMIT = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'develop', url: 'git@github.com:VaibhavGumalwad/Casestudy2.git'
            }
        }
        stage('Build & Push Docker Image') {
            steps {
                sh './scripts/build_and_push.sh'
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
