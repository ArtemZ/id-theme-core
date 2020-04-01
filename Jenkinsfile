def dockerTagAndUpload(imageName) {
    def tag = "${env.BUILD_ID}"
    sh "docker tag ${imageName}:${tag} eu.gcr.io/ping-dev-254502/${imageName}:${tag}"
    sh "docker push eu.gcr.io/ping-dev-254502/${imageName}:${tag}"
}
node {

    stage('Clone repo') {
        dir('build') {
            git branch: "jenkins-build", credentialsId: 	'exchange-jenkins-github-key', url: 'git@github.com:ArtemZ/id-theme-core.git'

        }
        dir('build/core-theme-login') {
            git branch: "master",        credentialsId: 	'exchange-jenkins-github-key', url: 'git@github.com:CorePassport/core-theme-login.git'
        }
        dir('build/core-theme-email') {
            git branch: "master",        credentialsId: 	'exchange-jenkins-github-key', url: 'git@github.com:CorePassport/core-theme-email.git'
        }
        dir('build/core-theme-account') {
            git branch: "master",        credentialsId: 	'exchange-jenkins-github-key', url: 'git@github.com:CorePassport/core-theme-account.git'
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