pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'  // Set your AWS region
        BUCKET_NAME = 'my-jenkins-s3bucket'  // Set your S3 bucket name
    }

    stages {
        stage('Install Terraform') {
            steps {
                script {
                    // Install Terraform if it's not already installed
                    sh 'curl -LO https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip'
                    sh 'unzip terraform_1.5.0_linux_amd64.zip'
                    sh 'sudo mv terraform /usr/local/bin/'
                    sh 'terraform -v' // Verify installation
                }
            }
        }

        stage('Checkout Terraform Code') {
            steps {
                script {
                    // Checkout your Terraform repository (if using version control)
                    // This assumes the Terraform files are part of the repository
                    checkout scm
                }
            }
        }

        stage('Initialize Terraform') {
            steps {
                script {
                    // Initialize Terraform to download required provider plugins
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Generate and show Terraform execution plan
                    sh 'terraform plan'
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                script {
                    // Apply the Terraform configuration to create the resources
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // Clean workspace after the pipeline
        }
    }
}
