pipeline {
    agent { docker "maven:3-jdk-8" }


    stages {

    	stage ('SCM Checkout') {
		steps {
			checkout([$class: 'GitSCM', branches: [[name: '*/prakashul-qa']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'e33a422c-b11f-4a16-8637-4037f9ddaf66', url: 'https://github.com/nitinbhadauria/KSS-Jenkins.git']]])
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
