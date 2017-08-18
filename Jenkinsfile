pipeline {
    agent { docker "maven:3-jdk-8" }


    stages {

    	stage ('SCM Checkout') {
		steps {
			script {
			try { 
				timeout(time: 20, unit: 'SECONDS') {

			checkout([$class: 'GitSCM', branches: [[name: '*/prakashul-qa']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'e33a422c-b11f-4a16-8637-4037f9ddaf66', url: 'https://github.com/nitinbhadauria/KSS-Jenkins.git']]])
  	   		}
              		
			}	

			catch(err) {
                err.printStackTrace()
                                                }
                sh 'echo Proceeding'
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
