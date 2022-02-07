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
        stage('Db create') {
            steps {
                sh 'bin/rails db:create'
            }   
        } 
        stage('Db create') {
            steps {
                sh 'bin/rails test:models'
            }   
        } 
    }
}