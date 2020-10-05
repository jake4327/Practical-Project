
pipeline{
        agent any
        stages{
           stage('Install Docker'){
                steps{
                    sh "sudo ./install_docker.sh"
                } 
	   }
	   stage('install Docker-compose'){
		steps{
                  sh "sudo ./install_docker_compose.sh"
                }
           } 
	}
}
