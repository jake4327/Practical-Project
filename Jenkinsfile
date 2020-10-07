
pipeline{
        agent any
/*
        stages{	
	   stage('Update system'){
                steps{
			sh "sudo apt update"
                }
           }

#	   stage('Install Docker'){
#               steps{
#                    sh "curl https://get.docker.com | sudo bash"
#                } 
#	   }
#	   stage('Add user to docker group'){
#                steps{
#                   sh "sudo usermod -aG docker \$(whoami)"
#                }
#           }
#	   stage('Clone project MVP branch'){
#		steps{
#		 sh '''
#                 LOCATION_OF_REPO=~/.jenkins/workspace/sfia-2-jenkins
#                  if [ -d "$LOCATION_OF_REPO" ]
#                  then
#                    continue
#                  else
#                    git clone -b development https://github.com/jake4327/Practical_Project  
#                  fi 
#                  cd \$LOCATION_OF_REPO
#                  git pull https://github.com/jake4327/Practical_Project.git development
#                  '''
#		}
#	   }
*/
           stage('Run docker-compose'){
		steps{
		             withCredentials([string(credentialsId: 'DATABASE_URI', variable: 'DATABASE_URI'),string(credentialsId: 'TEST_DATABASE_URI', variable: 'TEST_DATABASE_URI'), string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'MYSQL_ROOT_PASSWORD'),
                                       string(credentialsId: 'SECRET_KEY', variable: 'SECRET_KEY')]){
		                 sh '''
                                      sudo -E TEST_DATABASE_URI=${TEST_DATABASE_URI} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} DATABASE_URI=${DATABASE_URI} SECRET_KEY=${SECRET_KEY} docker-compose up -d
			         '''
		             }
		}
	   }
	}
}
