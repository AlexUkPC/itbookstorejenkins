pipeline {
    agent {
        label 'ssh'  
    }
    parameters {
        string(name: 'REF', defaultValue: '\${ghprbActualCommit}', description: 'Commit to build')
    }
    stages {
        // stage('Webpacker Install') {
        //     steps {
        //         sh '/usr/local/bin/docker-compose run --rm web_itbookstorejenkins bin/rails webpacker:install'
        //     }
        // }
        stage('Webpacker Install check') {
            steps {
                script {
                    try {
                        sh '/usr/local/bin/docker-compose run --rm web_itbookstorejenkins bin/rails webpacker:verify_install'
                    } 
                    catch (exception) {
                        echo "Not OK"
                    }
                }
            }
        }
        stage('Build') {
            steps {
                sh '/usr/local/bin/docker-compose stop'
                sh '/usr/local/bin/docker-compose up -d'
                timeout(120) {
                    waitUntil {
                        script {
                            try {
                                def response = httpRequest 'http://0.0.0.0:3029'
                                return (response.status == 200)
                            }
                            catch (exception) {
                                return false
                            }
                        }
                    }
                }
            }
        }
        // stage('Db create') {
        //     steps {
        //         sh 'bin/rails db:create'
        //     }   
        // } 
        stage('test') {
            steps {
                sh '/usr/local/bin/docker-compose exec -T --user "$(id -u):$(id -g)" web_itbookstorejenkins bin/rails test:models'
            }   
        } 
        stage('Stop server') {
            steps {
                sh '/usr/local/bin/docker-compose stop'
            }
        }
    }
}