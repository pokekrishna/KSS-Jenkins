pipeline {
  agent any
  stages {
    stage('Confirm Start?') {
      steps {
        input(message: 'Confirm Start?', id: 'confirm_start', ok: 'Yes')
      }
    }
    stage('Git Checkout') {
      steps {
        git(url: 'https://github.com/pokekrishna/KSS-Jenkins.git', branch: 'kss', changelog: true)
      }
    }
    stage('Check Files and Test') {
      steps {
        parallel(
          "Check Files": {
            sh 'ls'
            
          },
          "Run Tests": {
            sh 'mvn test'
            
          }
        )
      }
    }
  }
}