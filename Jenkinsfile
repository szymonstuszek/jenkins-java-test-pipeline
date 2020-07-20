pipeline {

    agent any

    stages {
        stage('Build') {
	    steps {
   	        sh '''
                    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                    ./jenkins/build/build.sh
		   '''
	    }
        }
    }

    stages {
        stage('Test') {
            steps {
                sh './jenkins/test/mvn.sh mvn test'
            }
        }
    }

    stages {
        stage('Push') {
            steps {
                sh './jenkins/push/push.sh'
            }
        }
    }

    stages {
        stage('Deploy') {
            steps {
                sh './jenkins/deploy/deploy.sh'
            }
        }
    }
}
