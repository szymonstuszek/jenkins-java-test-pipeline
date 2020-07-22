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
                        //transfer variables
                        echo maven-project > /tmp/.auth
                        echo $BUILD_TAG >> /tmp/.auth
                        echo $USERNAME >> /tmp/.auth
                        echo My new improved variables >> /tmp/.auth
                        echo what is the BUILD_ID? - $BUILD_ID
	                echo what is the TAG? $BUILD_TAG
                        //copy the variables to the prod machine
                        scp -i ${keyFile} /tmp/.auth $DEPLOYMENT_USER@$ADDRESS:/tmp/.auth
                        ssh -i ${keyFile} $DEPLOYMENT_USER@$ADDRESS /tmp/publish
                       '''
                }

                //sh './jenkins/deploy/deploy.sh'
            }
        }
    }
}
