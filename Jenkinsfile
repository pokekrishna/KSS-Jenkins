pipeline {
    agent { docker "maven:3-jdk-8" }
	environment {

git_repo_credential_token = 'eb5bc575b4e730027eeeec89c6fbb87a7b0436c8'
git_repo_url = 'https://github.com/nitinbhadauria/KSS-Jenkins.git'

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
