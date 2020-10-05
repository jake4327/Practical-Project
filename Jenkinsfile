
pipeline{
        agent any
        stages{
	   stage('Install Docker'){
                steps{
                    sh "curl https://get.docker.com | sudo bash"
                } 
	   }
	   stage('Install Docker'){
                steps{
		   sh "version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')"
		   # download to /usr/local/bin/docker-compose
		   sh "sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)"
		   # make the file executable
		   sh "sudo chmod +x /usr/local/bin/docker-compose"
                }
           }
           stage('Run docker-compose'){
		steps{
			sh "docker-compose up -d"
		}
	   }
	}
}
