def dockerTagAndUpload(imageName) {
    def tag = "${env.BUILD_ID}"
    sh "docker tag ${imageName}:${tag} ${env.REGISTRY_URL}/${imageName}:${tag}"
    sh "docker push ${env.REGISTRY_URL}/${imageName}:${tag}"
}
node {
    stage('Clone repo') {
        dir('build') {
            git branch: "master", credentialsId: 	'fdc45870-ba56-4467-9b93-a8a6786ce788', url: 'git@github.com:PingExchange/jenkins-utils.git'
        }
    }
    stage('Build and upload image') {
        def imageName = "keycloak-id-core-theme"
        sh "docker build . -t ${imageName}:${env.BUILD_ID}"
        dockerTagAndUpload(imageName)
    }
}