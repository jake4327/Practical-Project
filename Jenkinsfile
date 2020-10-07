
pipeline{
        agent any
        stages{	
	   stage('Update system'){
                steps{
			sh "sudo apt update"
                }
           }
           stage('Run app on test server'){
		steps{
		             withCredentials([file(credentialsId: 'PEM_KEY', variable: 'PEM_KEY')
                                              string(credentialsId: 'DATABASE_URI', variable: 'DATABASE_URI'),
					      string(credentialsId: 'TEST_DATABASE_URI', variable: 'TEST_DATABASE_URI'),
                                              string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'MYSQL_ROOT_PASSWORD'),
                                              string(credentialsId: 'SECRET_KEY', variable: 'SECRET_KEY'),
					      string(credentialsId: 'EC2_USER', variable: 'EC2_USER'),
					      string(credentialsId: 'EC2_IPv4_DNS_TEST', variable: 'EC2_IPv4_DNS_TEST')]){
		                 sh '''
				      ssh -tt -o "StrictHostKeyChecking=no" -i $PEM_KEY $EC2_USER@$EC2_IPv4_DNS << EOF 
 				      git clone -b development https://github.com/jake4327/Practical_Project.git
				      cd Practical_Project
			  	      export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} SECRET_KEY=${SECRET_KEY} TEST_DATABASE_URI=${TEST_DATABASE_URI}
                                      sudo -E TEST_DATABASE_URI=${TEST_DATABASE_URI} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} SECRET_KEY=${SECRET_KEY} docker-compose up -d
				      EOF
			         '''
		             }
		}
	  }
	stage('Run app on production server'){
                steps{
                             withCredentials([file(credentialsId: 'PEM_KEY', variable: 'PEM_KEY')
                                              string(credentialsId: 'DATABASE_URI', variable: 'DATABASE_URI'),
                                              string(credentialsId: 'DATABASE_URI', variable: 'DATABASE_URI'),
                                              string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'MYSQL_ROOT_PASSWORD'),
                                              string(credentialsId: 'SECRET_KEY', variable: 'SECRET_KEY'),
                                              string(credentialsId: 'EC2_USER', variable: 'EC2_USER'),
                                              string(credentialsId: 'EC2_IPv4_DNS_PRODUCTION', variable: 'EC2_IPv4_DNS_PRODUCTION')]){
                                 sh '''
                                      ssh -tt -o "StrictHostKeyChecking=no" -i $PEM_KEY $EC2_USER@$EC2_IPv4_DNS << EOF
                                      git clone -b development https://github.com/jake4327/Practical_Project.git
                                      cd Practical_Project
                                      export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} SECRET_KEY=${SECRET_KEY} DATABASE_URI=${DATABASE_URI}
                                      sudo -E TEST_DATABASE_URI=${TEST_DATABASE_URI} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} DATABASE_URI=${DATABASE_URI} SECRET_KEY=${SECRET_KEY} docker-compose up -d
                                      EOF
                                 '''
                             }
                }
          }
      }
}
