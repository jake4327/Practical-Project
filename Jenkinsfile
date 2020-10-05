pipeline{
        agent any
        stages{
           stage('Install Docker'){
                steps{
                    sh "./install_docker.sh"
                } 
	   }
	   stage('install Docker-compose'){
		steps{
                  sh "./install_docker_compose.sh"
                }
           } 
	}
}
