pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'  // Set your AWS region
        BUCKET_NAME = 'my-jenkins-s3bucket'  // Set your S3 bucket name
        TERRAFORM_VERSION = '1.5.0'  // Set the Terraform version you want to use
        TERRAFORM_DIR = "${WORKSPACE}/terraform"  // Path to install Terraform
    }

    stages {
        stage('Install Terraform') {
            steps {
                script {
                    // Create a directory for Terraform installation if it doesn't exist
                    sh "mkdir -p ${TERRAFORM_DIR}"

                    // Download Terraform
                    sh """
                    curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
                    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d ${TERRAFORM_DIR}
                    """

                    // Move the terraform binary into the workspace
                    sh "mv ${TERRAFORM_DIR}/terraform /usr/local/bin/"

                    // Verify the installation
                    sh "terraform -v"
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
