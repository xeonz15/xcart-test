timestamps {


node () {

    def HDIR= "${JENKINS_HOME}"

        stage ('xcart - Checkout') {
         checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/xeonz15/xcart-test.git/']]])
        }
        stage ('xcart - Build') {

            withCredentials([
                string(credentialsId: 'c_DO_TOKEN', variable: 'cr_DO_TOKEN')
            ]) {
             sh """
             ${WORKSPACE}/create_ssh_key.sh ${HDIR}
             ${WORKSPACE}/create_droplet.sh ${cr_DO_TOKEN}
             ${WORKSPACE}/configure_droplet-docker-ver.sh
             ${WORKSPACE}/create_snapshot.sh ${cr_DO_TOKEN}
              """
            }
        }
}
}

