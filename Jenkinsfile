#!/usr/bin/env groovy
pipeline {
  agent any

  tools {
    nodejs 'Node-18.16.0'
  }

  stages {
    stage('Build') {
      steps {
        echo 'Building...'
          sh 'npm install'
          sh 'npm run build'
      }
    }
    stage('Test') {
      steps {
        echo 'Testing...'
        sh 'npm run test'
      }
    }
    stage('Deploy') {
      when {
        branch 'master'
      }
      steps {
        echo 'Deploying...'
      }
    }
  }
}
