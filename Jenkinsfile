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
        // nodejs('Node-18.16.0') {
          sh 'npm install'
          sh 'npm run build'
        // }
      }
    }
    stage('Test') {
      steps {
        echo 'Testing...'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying...'
      }
    }
  }
}
