timestamps {


node () {

 def DBName = "xcart"
 def DBUser = "xcart"
 //def DBPass = DBParams['DBPass']


        stage ('xcart - Checkout') {
         checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/xeonz15/xcart-test.git/']]])
        }
        stage ('xcart - Build') {

            withCredentials([
                string(credentialsId: 'c_DO_TOKEN', variable: 'cr_DO_TOKEN')
                string(credentialsId: 'c_DB_pass', variable: 'DBPass')
            ]) {
             sh """
             ${WORKSPACE}/create_droplet.sh ${cr_DO_TOKEN}
             ${WORKSPACE}/configure_droplet.sh ${DBName} ${DBUser} ${DBPass}
              """
            }
        }
}
}

