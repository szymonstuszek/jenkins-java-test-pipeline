pipeline {

    agent any

    environment {
      PASS = credentials('registry-pass')
      USERNAME = credentials('registry-user')
      ADDRESS = credentials('remote-ip')
      DEPLOYMENT_USER = credentials('deployment-user')
      CURRENT_WORKSPACE = "${WORKSPACE1}${JOB_NAME}"
      KEY_ID = credentials('javaTestJobKey')
      IMAGE = 'maven-project'
    }

    stages {
        stage('Build') {
	    steps {
                echo "Running job: ${BUILD_TAG}"
   	        sh '''
                    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                    ./jenkins/build/build.sh
		   '''
	    }
        }
   
        stage('Test') {
            steps {
                sh './jenkins/test/mvn.sh mvn test'
            }
        }

        stage('Push') {
            steps {
                sh './jenkins/push/push.sh'
            }
        }

        stage('Deploy') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: "${KEY_ID}", keyFileVariable: 'keyFile')]) {
                    sh '''
                        sleep 5
                        echo maven-project > /tmp/.auth
                        echo $BUILD_TAG >> /tmp/.auth
                        echo $USERNAME >> /tmp/.auth
                        echo $PASS >> /tmp/.auth
                        
                        scp -i ${keyFile} /tmp/.auth $DEPLOYMENT_USER@$ADDRESS:/tmp/.auth
                        scp -i ${keyFile} ./jenkins/deploy/publish.sh $DEPLOYMENT_USER@$ADDRESS:/tmp/publish
                        ssh -i ${keyFile} $DEPLOYMENT_USER@$ADDRESS /tmp/publish
                       '''
                }
            }
        }
    }

    post {
        always {
            withCredentials([sshUserPrivateKey(credentialsId: "${KEY_ID}", keyFileVariable: 'keyFile')]) {
                sh 'ssh -i ${keyFile} $DEPLOYMENT_USER@$ADDRESS rm /tmp/.auth'
            }
        }
    }
}
