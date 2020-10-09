
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
		             withCredentials([file(credentialsId: 'PEM_KEY', variable: 'PEM_KEY'),
                                              string(credentialsId: 'DATABASE_URI', variable: 'DATABASE_URI'),
					      string(credentialsId: 'TEST_DATABASE_URI', variable: 'TEST_DATABASE_URI'),
                                              string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'MYSQL_ROOT_PASSWORD'),
                                              string(credentialsId: 'SECRET_KEY', variable: 'SECRET_KEY'),
					      string(credentialsId: 'EC2_USER', variable: 'EC2_USER'),
					      string(credentialsId: 'EC2_IPv4_DNS_TEST', variable: 'EC2_IPv4_DNS_TEST')]){
		                 sh '''
				                      ssh -tt -o "StrictHostKeyChecking=no" -i ${PEM_KEY} ubuntu@ec2-50-112-55-155.us-west-2.compute.amazonaws.com << EOF
			                          export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} DATABASE_URI=${DATABASE_URI} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} SECRET_KEY=${SECRET_KEY} TEST_DATABASE_URI=mysql+pymysql://admin:password@database-1.cgmsgfpt9oix.us-west-2.rds.amazonaws.com:3306/testdb
			                          git clone https://github.com/jake4327/Practical_Project.git
			                          cd Practical_Project
                                      sudo -E TEST_DATABASE_URI=${TEST_DATABASE_URI} DATABASE_URI=${DATABASE_URI} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} SECRET_KEY=${SECRET_KEY} docker-compose up -d
				      
                                      touch TEST_RESULTS.txt
                                      echo "hello-world" >> TEST_RESULTS.txt
                                      docker exec practical_project_backend_1 pytest --cov application > TEST_RESULTS.txt
                                      exit
                                      echo "hello world"
                                      EOF
			                '''
		             }
		}
	  }


	stage('Run app on kubernetes'){
                steps{
                             withCredentials([file(credentialsId: 'PEM_KEY', variable: 'PEM_KEY'),
                                              string(credentialsId: 'DATABASE_URI', variable: 'DATABASE_URI'),
                                              string(credentialsId: 'TEST_DATABASE_URI', variable: 'TEST_DATABASE_URI'),
                                              string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'MYSQL_ROOT_PASSWORD'),
                                              string(credentialsId: 'SECRET_KEY', variable: 'SECRET_KEY'),
                                              string(credentialsId: 'EC2_USER', variable: 'EC2_USER'),
                                              string(credentialsId: 'EC2_IPv4_DNS_PRODUCTION', variable: 'EC2_IPv4_DNS_PRODUCTION')]){
                                /* sh '''
                                      ssh -tt -o "StrictHostKeyChecking=no" -i $PEM_KEY $EC2_USER@$EC2_IPv4_DNS << EOF
                                      git clone -b development https://github.com/jake4327/Practical_Project.git
                                      cd Practical_Project
                                      export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} TEST_DATABASE_URI=${TEST_DATABASE_URI} SECRET_KEY=${SECRET_KEY} DATABASE_URI=${DATABASE_URI}
                                      sudo -E MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} DATABASE_URI=${DATABASE_URI} SECRET_KEY=${SECRET_KEY} docker-compose up -d
                                      EOF
                                 '''*/
                                 echo hello
                             }
                }
         }

      }
}
