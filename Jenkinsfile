
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
			sh "sudo docker-compose up -d"
		}
	   }
	}
}
