pipeline{
        agent any
        stages{
           stage('Install Docker'){
                steps{
                    sh "curl https://get.docker.com | sudo bash"
                } 
	   }
	   stage('install Docker-compose'){
		steps{
                  sh "./install_docker_compose.sh"
                }
           } 
	}
}
