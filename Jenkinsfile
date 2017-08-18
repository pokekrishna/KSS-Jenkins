pipeline {
    agent { docker "maven:3.5-jdk-8" }
    stages {
        stage("build") {
            steps {
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
