pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    stages {
        stage('Checkout Terraform Code') {
            steps {
                script {
                    // Checkout your Terraform repository (if using version control for it)
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

        // stage('Apply Terraform') {
        //     steps {
        //         script {
        //             // Apply the Terraform configuration to create the resources
        //             sh 'terraform apply -auto-approve'
        //         }
        //     }
        // }
        stage("apply") {
            when {
                expression { params.ACTION == 'apply' }
            }
            steps {
                script {
                    // Apply the Terraform configuration to create the resources
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage("destroy") {
            when {
                expression { params.ACTION == 'destroy' }
            }
            steps {
                script {
                    // Apply the Terraform configuration to create the resources
                    sh 'terraform destroy -auto-approve'
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
