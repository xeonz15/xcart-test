timestamps {

//def DBParams = input message: 'Please set Database Parameters', parameters: [string(defaultValue: 'xcart', description: 'Database name', name: 'DBName', trim: false), string(defaultValue: 'xcart', description: 'Database user', name: 'DBUser', trim: false), password(defaultValue: 'xcart1234', description: 'Database password', name: 'DBPass')]

node () {

 def DBName = DBParams['DBName']
 def DBUser = DBParams['DBUser']
 #def DBPass = DBParams['DBPass']


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

