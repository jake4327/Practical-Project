
pipeline{
        agent any
        stages{	
           stage('Update system'){
                    steps{
                        sh "sudo apt update"
                    }
           }

           stage('Run app on test server'){
                 load "/home/jenkins/.envvars/env-vars.groovy"
                 steps{
                        withCredentials([file(credentialsId: 'PEM_KEY', variable: 'PEM_KEY')]){
                         sh '''
                                      ssh -tt -o "StrictHostKeyChecking=no" -i ${PEM_KEY} $EC2_USER@$EC2_IPv4_DNS_TEST << EOF
                                      export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} DATABASE_URI=${DATABASE_URI} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} SECRET_KEY=${SECRET_KEY} TEST_DATABASE_URI=mysql+pymysql://admin:password@database-1.cgmsgfpt9oix.us-west-2.rds.amazonaws.com:3306/testdb
                                      git clone https://github.com/jake4327/Practical_Project.git
                                      cd Practical_Project
                                      sudo -E TEST_DATABASE_URI=${TEST_DATABASE_URI} DATABASE_URI=${DATABASE_URI} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} SECRET_KEY=${SECRET_KEY} docker-compose up -d

                                      touch TEST_RESULTS.txt

                                      docker exec practical_project_backend_1 pytest --cov application > TEST_RESULTS.txt
                                      exit

                                      EOF
                         '''
                        }
                            sh 'echo "skipping steps"'
                 }
           }


            stage('Intstall K8S'){
                        steps{
                            sh '''
                               curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
                               chmod +x ./kubectl
                               sudo mv ./kubectl /usr/local/bin/kubectl
                               kubectl version --client
                             '''
                        }
            }
            stage('Run simple pod'){
                        steps{
                            sh '''
                                cd Practical_Project/K8S
                                kubectl create -f resources_pod.yaml
                                kubectl get pods
                                kubectl describe pod | more
                             '''
                        }
            }

     }
}
