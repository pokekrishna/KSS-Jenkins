pipeline {
    agent { docker "maven:3-jdk-8" }
    stages {
        stage("build") {
            steps {
                sh 'mvn package'
                sh 'ls -R *'
            }
        }
    }
    post {
        always {
            archive "target/**/*"
            junit 'target/surefire-reports/*.xml'
        }
    }
}
