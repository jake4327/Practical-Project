
pipeline{
        agent any
        stages{	
	   stage('Update system'){
                steps{
			sh "sudo apt update"
                }
           }
	   stage('Install Docker'){
                steps{
                    sh "curl https://get.docker.com | sudo bash"
                } 
	   }
	   stage('Add user to docker group'){
                steps{
                   sh "sudo usermod -aG docker \$(whoami)"
                }
           }
	   stage('Install Docker-compose'){
                steps{
		   sh """
			sudo apt install -y curl jq
                        version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
                        sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                        sudo chmod +x /usr/local/bin/docker-compose
		   """
                }
           }
	   stage('Clone project MVP branch'){
		steps{
		 sh '''
                  LOCATION_OF_REPO=/home/jenkins/.jenkins/workspace/
                  if [ -d "$LOCATION_OF_REPO" ]
                  then
                    continue
                  else
                    git clone -b MVP https://github.com/jake4327/Practical_Project  
                  fi 
                  cd $LOCATION_OF_REPO
                  git pull
                  '''
		}
	   }
           stage('Run docker-compose'){
		steps{
			sh "sudo docker-compose up -d"
		}
	   }
	}
}
