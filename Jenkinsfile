pipeline {
    agent any

    environment {
        // Azure Service Principal credentials configured in Jenkins Credentials Manager
        ARM_CLIENT_ID       = credentials('4f098f30-d985-42a7-ab79-ccacfeb63f61')
        ARM_CLIENT_SECRET   = credentials('tJ18Q~L9SdFzBNxNlQrB2p7cE2MDx5MRYHIh0aP-')
        ARM_TENANT_ID       = credentials('f318d863-cbfc-45da-a55b-5d0417569430')
        ARM_SUBSCRIPTION_ID = credentials('da4b743b-bf70-41b9-905f-e402e5dc9066')
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the GitHub repo containing Terraform files
                git url: 'https://github.com/sushantpadmanabhi/Project-8.git', branch: 'main'
            }
        }
        stage('Azure Login') {
            steps {
                // Log in to Azure using the Service Principal credentials
                sh '''
                  az login --service-principal -u "$ARM_CLIENT_ID" -p "$ARM_CLIENT_SECRET" --tenant "$ARM_TENANT_ID"
                '''
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
        stage('SonarQube Analysis') {
            steps {
                // Ensure SonarQube is configured in Jenkins Global Tool Configuration.
                withSonarQubeEnv('SonarQube') {
                    sh 'sonar-scanner'
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline completed.'
        }
    }
}
