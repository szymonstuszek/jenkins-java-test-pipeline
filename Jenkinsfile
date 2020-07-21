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
                        ssh -i ${keyFile} $DEPLOYMENT_USER@$ADDRESS && 
                        touch /tmp/testfile
                       '''
                }

                //sshagent(credentials : ['3c9aa11c-a1cb-49e9-b8fb-8842391165a0']) {

                //}
                //sh './jenkins/deploy/deploy.sh'
            }
        }
    }
}
