node{
    def app
    stage('Clone') {
        checkout scm
    }
    stage('Build') {
        app = docker.build("nico/pika")
    }
}