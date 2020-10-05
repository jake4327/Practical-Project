
pipeline{
        agent any
        stages{
	   stage('Install Docker'){
                steps{
                    sh "curl https://get.docker.com | sudo bash"
                } 
	   }
           stage('Run docker-compose'){
		steps{
			sh "docker-compose up -d"
		}
	   }
	}
}
