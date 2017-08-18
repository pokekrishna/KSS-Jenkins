pipeline {
    agent { docker "java" }
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
