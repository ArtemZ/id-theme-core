def dockerTagAndUpload(imageName) {
    def tag = "${env.BUILD_ID}"
    sh "docker tag ${imageName}:${tag} ${env.REGISTRY_URL}/${imageName}:${tag}"
    sh "docker push ${env.REGISTRY_URL}/${imageName}:${tag}"
}
node {
    environment {
        HOME = '/tmp'
        REGISTRY_URL = 'eu.gcr.io/ping-dev-254502'
    }
    stage('Clone repo') {
        dir('build') {
            git branch: "jenkins-build", credentialsId: 	'exchange-jenkins-github-key', url: 'git@github.com:ArtemZ/id-theme-core.git'
        }
    }
    stage('Build and upload image') {
        def imageName = "keycloak-id-core-theme"
        dir('build') {
            sh "docker build . -t ${imageName}:${env.BUILD_ID}"
        }
        dockerTagAndUpload(imageName)
    }
}