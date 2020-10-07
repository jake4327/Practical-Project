
pipeline{
        agent any
        stages{	
	   stage('Update system'){
                steps{
			sh "sudo apt update"
                }
           }
/*
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
           stage('Run app on test server'){
		steps{
		             withCredentials([file(credentialsId: 'PEM_KEY', variable: 'PEM_KEY')
                                              string(credentialsId: 'DATABASE_URI', variable: 'DATABASE_URI'),
					      string(credentialsId: 'TEST_DATABASE_URI', variable: 'TEST_DATABASE_URI'),
                                              string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'MYSQL_ROOT_PASSWORD'),
                                              string(credentialsId: 'SECRET_KEY', variable: 'SECRET_KEY')]){
		                 sh '''
				      ssh -i $PEM_KEY ubuntu@#EC2 instance << EOF 
 				      git clone -b development https://github.com/jake4327/Practical_Project.git
				      cd Practical_Project
			  	      export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} SECRET_KEY=${SECRET_KEY} DATABASE_URI=${DATABASE_URI} TEST_DATABASE_URI=${TEST_DATABASE_URI}
                                      sudo -E TEST_DATABASE_URI=${TEST_DATABASE_URI} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} DATABASE_URI=${DATABASE_URI} SECRET_KEY=${SECRET_KEY} docker-compose up -d
				      EOF
			         '''
		             }
		}
	   }
	}
}
