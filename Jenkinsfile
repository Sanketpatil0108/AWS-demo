pipeline {
    agent any
    tools {
        nodejs 'NodeJS 18'
        maven 'Maven 3.8.8'
    }

    environment {
        DEPLOY_HOST = 'ec2-user@<APP_PUBLIC_IP>'
        SSH_KEY = 'ec2-deploy-key'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github-creds-id', url: 'https://github.com/your/repo.git'
            }
        }

        stage('Build React') {
            steps {
                dir('frontend') {
                    sh 'npm install --legacy-peer-deps'
                    sh 'npm run build'
                }
            }
        }

        stage('Build Spring Boot') {
            steps {
                dir('backend') {
                    sh 'mvn clean package -DskipTests'
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent (credentials: [SSH_KEY]) {
                    sh """
                    scp -o StrictHostKeyChecking=no backend/target/*.jar ${DEPLOY_HOST}:/home/ec2-user/app.jar
                    scp -r -o StrictHostKeyChecking=no frontend/build/* ${DEPLOY_HOST}:/var/www/html/
                    ssh -o StrictHostKeyChecking=no ${DEPLOY_HOST} '
                        pkill -f "java" || true
                        nohup java -jar /home/ec2-user/app.jar > app.log 2>&1 &
                    '
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Deployed successfully!'
        }
        failure {
            echo 'Build or deploy failed.'
        }
    }
}
