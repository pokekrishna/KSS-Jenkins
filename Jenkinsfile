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
      agent {
        label 'maven-docker'
      }
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
    stage('Packing and Stashing') {
      agent {
        label 'maven-docker'
      }
      steps {
        sh 'mvn package -Dmaven.test.skip=true'
        stash(name: 'stash_artefact', includes: 'target/KSS-Jenkins-1.0-SNAPSHOT.jar')
      }
    }
    stage('Unstash the artefact') {
      steps {
        unstash 'target/KSS-Jenkins-1.0-SNAPSHOT.jar'
      }
    }
  }
}