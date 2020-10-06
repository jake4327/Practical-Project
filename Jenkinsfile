
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
	   stage('Clone project MVP branch'){
		steps{
		 sh '''
                  LOCATION_OF_REPO=~/.jenkins/workspace/sfia-2-jenkins
                  if [ -d "$LOCATION_OF_REPO" ]
                  then
                    continue
                  else
                    git clone -b development https://github.com/jake4327/Practical_Project  
                  fi 
                  cd \$LOCATION_OF_REPO
                  git pull https://github.com/jake4327/Practical_Project.git development
                  '''
		}
	   }
           stage('Run docker-compose'){
		steps{
		sh '''
		  export SECRET_KEY
                  export DATABASE_URI
                  export MYSQL_ROOT_PASSWORD
                  sudo -E MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} DATABASE_URI=${DATABASE_URI} SECRET_KEY=${SECRET_KEY} docker-compose pull && sudo -E MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} DATABASE_URI=${DATABASE_URI} SECRET_KEY=${SECRET_KEY} docker-compose up -d
		'''
		}
	   }
	}
}
