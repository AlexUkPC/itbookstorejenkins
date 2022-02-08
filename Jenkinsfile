pipeline {
    agent {
        label 'ssh'  
    }
    parameters {
        string(name: 'REF', defaultValue: '\${ghprbActualCommit}', description: 'Commit to build')
    }
    stages {
        stage('Webpacker Install') {
            steps {
                sh '/usr/local/bin/docker-compose run --rm web_itbookstorejenkins bin/rails webpacker:install'
            }
        }
        stage('Build') {
            steps {
                sh '/usr/local/bin/docker-compose up'
            }
        }
        // stage('Db create') {
        //     steps {
        //         sh 'bin/rails db:create'
        //     }   
        // } 
        // stage('test') {
        //     steps {
        //         sh 'bin/rails test:models'
        //     }   
        // } 
    }
}