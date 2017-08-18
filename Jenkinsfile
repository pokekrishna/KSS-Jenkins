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

	stage("build_artifact") {
            steps {
                sh 'mvn package'
                sh 'ls -R *'

                  }
                }

    stage("build_push_image") {

        steps {
                  script {
                 sh "cp target/KSS-Jenkins-1.0-SNAPSHOT.jar ./tmp-docker-build-context"
                 withDockerRegistry([credentialsId: 'b6ef8f34-268d-4a12-a02f-c0eb8bf002ec', url: "https://hub.docker.com/"]) {
  // we give the image the same version as the .war package
  def image = docker.build("prakashul/knowledgemeet:${BUILD_ID}",  ./tmp-docker-build-context")
                image.push()
              }}
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
