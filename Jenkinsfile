pipeline{
        agent any
        stages{
           stage('Make Directory'){
                steps{
                    sh "mkdir ~/jenkins-tutorial-test"
                }
           }
           stage('Make Files'){
                steps{
                    sh "touch ~/jenkins-tutorial-test/file1 ~/jenkins-tutorial-test/file2"
                }
           }
           stage('Install Docker'){
                steps{
                    sh "curl https://get.docker.com | sudo bash"
                } 
	   }
	   stage('install Docker-compose'){
		steps{
                  sh "./install_docker_compose.sh"
                }
           } 
	}
}
