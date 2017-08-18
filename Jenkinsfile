pipeline {
    agent { docker "maven:3-jdk-8" }
	environment {


}


    stages {

    	stage ('SCM Checkout') {
		steps {

    		script {
    			git branch: branch, credentialsId: git_repo_credential_token, url: git_repo_url
  	   		}
              		}	
                         	} 

	stage("build") {
            steps {
                sh 'mvn package'
                sh 'ls -R *'
            }
        }
    } 

    post {
        always {
            archive "target/**/*.jar"
            junit 'target/surefire-reports/*.xml'
        }
    }
}
