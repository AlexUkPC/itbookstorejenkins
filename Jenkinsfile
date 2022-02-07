pipeline {
    agent {
        dockerfile {
            label 'ssh'
      }   
    }
    parameters {
        string(name: 'REF', defaultValue: '\${ghprbActualCommit}', description: 'Commit to build')
    }
    stages {
        stage('Check ruby version') {
            steps {
                sh 'ruby -v'
            }   
        } 
        stage('Check directories') {
            steps {
                sh 'ls itbookstorejenkins -l'
            }   
        } 
        stage('Check files in bin') {
            steps {
                sh 'ls itbookstorejenkins/bin -l'
            }   
        } 
        stage('Create db') {
            steps {
                sh 'itbookstorejenkins/bin/rails db:create'
            }   
        } 
        stage('Test') {
            steps {
                sh 'itbookstorejenkins/bin/rails test:models'
            }   
        } 
    }
}