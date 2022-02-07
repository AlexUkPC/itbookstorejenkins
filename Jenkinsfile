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
        stage('Compile') {
            steps {
                sh 'bin/rails test:models'
            }   
        } 
    }
}