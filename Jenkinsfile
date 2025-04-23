pipeline {
    agent any  // This will use any available agent (node or EC2 instance)

    stages {
        // Install NodeJS stage
        stage('Install NodeJS') {
            steps {
                script {
                    // Install NodeJS 18.x if not already installed
                    sh '''
                    curl -sL https://rpm.nodesource.com/setup_18.x | sudo -E bash -
                    sudo yum install -y nodejs
                    '''
                    // Verify NodeJS installation
                    sh 'node -v'
                }
            }
        }

        // Install Maven stage
        stage('Install Maven') {
            steps {
                script {
                    // Install Maven 3.8.8 if not already installed
                    sh '''
                    sudo yum install -y maven
                    '''
                    // Verify Maven installation
                    sh 'mvn -v'
                }
            }
        }

        // Build stage for React and Spring Boot (Frontend and Backend)
        stage('Build and Deploy') {
            steps {
                script {
                    // Building the frontend (React)
                    echo 'Building the frontend (React)'
                    sh 'cd frontend && npm install && npm run build'  // Replace `frontend` with your React app folder

                    // Building the backend (Spring Boot)
                    echo 'Building the backend (Spring Boot)'
                    sh 'cd backend && mvn clean install'  // Replace `backend` with your Spring Boot app folder

                    // Deploy frontend and backend
                    echo 'Deploying the application'
                    // Add your deploy commands here
                    // For example, copy the built files to the EC2 instance, or restart the app
                }
            }
        }
    }

    post {
        always {
            // Clean up steps (optional)
            echo 'Cleaning up after build...'
        }
        success {
            echo 'Build completed successfully!'
        }
        failure {
            echo 'Build failed. Please check the logs.'
        }
    }
}
