pipeline {
  agent any
  stages {
    stage('User Confirmation') {
      steps {
        input(message: 'Confirm Start?', id: 'confirm_start', ok: 'True')
      }
    }
    stage('Test') {
      steps {
        sh 'make check'
        junit 'reports/**/*.xml'
      }
    }
    stage('Deploy') {
      steps {
        sh 'make publish'
      }
    }
  }
}