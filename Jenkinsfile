
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
                        load "/home/jenkins/.envvars/env-vars.groovy"
                        withCredentials([file(credentialsId: 'PEM_KEY', variable: 'PEM_KEY')]){
                         sh '''
                         ssh -tt -o "StrictHostKeyChecking=no" -i ${PEM_KEY} $EC2_USER@$EC2_IPv4_DNS_TEST << EOF
                              export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} DATABASE_URI=${DATABASE_URI} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} SECRET_KEY=${SECRET_KEY} TEST_DATABASE_URI=mysql+pymysql://admin:password@database-1.cgmsgfpt9oix.us-west-2.rds.amazonaws.com:3306/testdb
                              git clone -b development https://github.com/jake4327/Practical_Project.git
                              cd Practical_Project
                              sudo -E TEST_DATABASE_URI=${TEST_DATABASE_URI} DATABASE_URI=${DATABASE_URI} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} SECRET_KEY=${SECRET_KEY} docker-compose up -d
                              touch TEST_RESULTS.txt
                              docker exec practical_project_backend_1 pytest --cov application > TEST_RESULTS_BACKEND_1.txt
                              docker exec practical_project_backend_1 pytest --cov application > TEST_RESULTS_FRONTEND_1.txt 
                              cat TEST_RESULTS_BACKEND.txt
                              cat TEST_RESULTS_FRONTEND_1.txt
                              exit
                              EOF
                         '''
                        }
                 }
           }

           /* Done manually, will automate - script needs to be written ssh to master when the cluster is valid.
            stage('Create Cluster'){
             steps{
                    //git clone SFIA2_REPO
                    sh '''
                        export AWS_ACCESS_KEY=$AccessKeyValue
                        export AWS_SECRET_KEY=$SecretAccessKeyValue
                        pip install awscli --upgrade --user
                        aws configure --aws_access_key_id $AWS_ACCESS_KEY --aws_secret_access_key $AWS_SECRET_KEY
                        export bucket_name=jake-kops-state-store
                        aws s3api create-bucket \
                        --bucket ${bucket_name} \
                        --region us-east-1
                        aws s3api put-bucket-versioning --bucket ${bucket_name} --versioning-configuration Status=Enabled
                        export KOPS_CLUSTER_NAME=jake.k8s.local
                        export KOPS_STATE_STORE=s3://${bucket_name}
                        kops create cluster \
                        --state=${KOPS_STATE_STORE} \
                        --node-count=2 \
                        --master-size=t2.micro \
                        --node-size=t2.micro \
                        --zones=us-east-2a \
                        --name=${KOPS_CLUSTER_NAME} \
                        --dns private \
                        --master-count 1
                        #sleep 500
                        kops update cluster --name ${KOPS_CLUSTER_NAME} --yes
                        kops validate cluster
                     '''
                }
            }
            
            stage('Run simple pod'){
                        steps{
                            load "/home/jenkins/.envvars/env-vars.groovy"
                            sh '''
                                git clone https://github.com/jake4327/Practical_Project.git
                                ssh $CLUSTER_USER@$MASTER_IPv4 << EOF
                                    export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD_PROD} DATABASE_URI=${DATABASE_URI_PROD}
                                    export SECRET_KEY=${SECRET_KEY_PROD} TEST_DATABASE_URI=${TEST_DATABASE_URI_PROD}
                                    kubectl create -f Practical_Project/K8S/
                                    kubectl get svc
                                EOF
                             '''
                        }
            }
            */

     }
}
