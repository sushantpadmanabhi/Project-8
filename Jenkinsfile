pipeline {
    agent any

    environment {
        AZURE_SP = credentials('AZURE_SP_CREDENTIALS')  // Fetches Azure Service Principal credentials from Jenkins
        TENANT_ID = 'f318d863-cbfc-45da-a55b-5d0417569430'  // Replace with your actual Azure Tenant ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/sushantpadmanabhi/Project-8.git'
            }
        }

        stage('Login to Azure') {
            steps {
                script {
                    bat """
                    az login --service-principal -u $AZURE_SP_USR -p $AZURE_SP_PSW --tenant $TENANT_ID
                    """
                }
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                bat 'terraform apply -auto-approve'
            }
        }
    }
}
