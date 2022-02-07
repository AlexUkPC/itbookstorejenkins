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
        stage('Create db') {
            steps {
                bash 'bin/rails db:create'
            }   
        } 
        stage('Test') {
            steps {
                bash 'bin/rails test:models'
            }   
        } 
    }
}