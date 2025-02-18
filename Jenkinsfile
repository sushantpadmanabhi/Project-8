pipeline {
    agent any

    environment {
        AZURE_SP = credentials('AZURE_SP_CREDENTIALS')  // Fetches stored username & password
        TENANT_ID = 'f318d863-cbfc-45da-a55b-5d0417569430'  // Replace with actual Tenant ID
    }

    stages {
        stage('Login to Azure') {
            steps {
                script {
                    sh """
                    az login --service-principal -u $AZURE_SP_USR -p $AZURE_SP_PSW --tenant $TENANT_ID
                    """
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
