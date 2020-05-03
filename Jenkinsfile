timestamps {

node () {

parameters {
        string(defaultValue: "xcart", description: 'X-Cart Database Name', name: 'DBName')
        string(defaultValue: "xcart", description: 'X-Cart Database User', name: 'DBUser') 
        string(defaultValue: "xcart12345", description: 'X-Cart Database Password', name: 'DBPass')
}

	stage ('xcart - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/xeonz15/xcart-test.git/']]]) 
	}
	stage ('xcart - Build') {
 	
	    withCredentials([string(credentialsId: 'c_DO_TOKEN', variable: 'cr_DO_TOKEN')]) {
	     sh """ 
	     ${WORKSPACE}/create_droplet.sh ${cr_DO_TOKEN}
	     ${WORKSPACE}/configure_droplet.sh ${params.DBName} ${params.DBUser} ${params.DBPass}
	      """ 
	    }
	}
}
}
