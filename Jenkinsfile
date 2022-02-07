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
                sh 'cd itbookstorejenkins'
            }   
        } 
        stage('Check files in bin') {
            steps {
                sh 'ls bin -l'
            }   
        } 
        stage('bundle') {
            steps {
                sh 'bundle install'
            }   
        } 
        stage('Create db') {
            steps {
                sh 'bin/rails db:create'
            }   
        } 
        stage('Test') {
            steps {
                sh 'bin/rails test:models'
            }   
        } 
    }
}