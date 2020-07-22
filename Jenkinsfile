pipeline {

    agent any

    environment {
      PASS = credentials('registry-pass')
      USERNAME = credentials('registry-user')
      ADDRESS = credentials('remote-ip')
      DEPLOYMENT_USER = credentials('deployment-user')
    }

    stages {
/* temp comment to test ssh
        stage('Build') {
	    steps {
   	        sh '''
                    echo Running build $BUILD_ID
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
*/
        stage('Deploy') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: "3c9aa11c-a1cb-49e9-b8fb-8842391165a0", keyFileVariable: 'keyFile')]) {
                    sh '''
                        echo maven-project > /tmp/.auth
                        echo $BUILD_TAG >> /tmp/.auth
                        echo $USERNAME >> /tmp/.auth
                        echo $PASS >> /tmp/.auth
                        
                        scp -i ${keyFile} /tmp/.auth $DEPLOYMENT_USER@$ADDRESS:/tmp/.auth
                        scp -i ${keyFile} ./jenkins/deploy/publish.sh $DEPLOYMENT_USER@$ADDRESS:/tmp/publish
                        ssh -i ${keyFile} $DEPLOYMENT_USER@$ADDRESS rm /tmp/.auth
                       '''
                }

                //sh './jenkins/deploy/deploy.sh'
            }
        }
    }
}
