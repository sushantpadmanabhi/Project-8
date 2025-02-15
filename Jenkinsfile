pipeline {
    agent any

    environment {
        ARM_SUBSCRIPTION_ID = 'da4b743b-bf70-41b9-905f-e402e5dc9066'
        ARM_CLIENT_ID = '4f098f30-d985-42a7-ab79-ccacfeb63f61'
        ARM_CLIENT_SECRET = 'tJ18Q~L9SdFzBNxNlQrB2p7cE2MDx5MRYHIh0aP-'
        ARM_TENANT_ID = 'f318d863-cbfc-45da-a55b-5d0417569430'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/sushantpadmanabhi/Project-8.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
