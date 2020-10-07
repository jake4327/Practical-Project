# Practical Project 

## SFIA assessment 2 

- [Introduction](#Introduction)
- [Infrastucture](#Infrastructure)
- [Testing](#Testing)
- [Database](#Database)
- [Risk Assessment](#Risk%20Assessment)
  - [MoSCoW](#MoSCoW)
  - [Docker](#Docker)
  - [Cloud Computing](#Cloud%20Computing)
  - [Database Risks](#Database%20Risks)
  - [Network](#Network)
- [References](#References)
 
## Introduction 

SFIA Project 2

This project requires the deployment of an app using technologies of the web server.

## Infastructure

### Amazon Web Services (AWS)

#### EC2 instances
##### Sercurity groups
##### Load balancer

#### VCP 
##### Route tables
##### NACL
##### NAT Gateway 
##### Subnets

## Testing
 
## Database

### RDS

### MySQL 
 
### Sercurity

## Planning

### Docker Compose 

![](pictures/docker-compose.jpg)

The appraoch to writing the docker compose file is the write out the single line commands 
that need executing in the application and once the commands are scrutinized and accepted 
compose the docker-compose.yaml file.

>docker-compose command

>docker-compose command

>docker-compose command

>docker-compose command

>docker-compose command

>yaml

>yaml 

>yaml

>yaml

>yaml

### Jenkins

![](pictures/jenkins.jpg)

Jenkins will use a pipeline to execute and run the containers from the commandline.
The same format will be followed, the commands will be written and then analysed, after 
a Jenkins build will be initiated.

>command

>command

>command 

>Jenkins build

### Dockerfiles

![](pictures/docker.png)

Dockerfiles are the files that will tell the container how to run, by building the base image and 
running commands in the terminal, yet again the docker commands will be impliement check for sincerity
and turned into a Dockerfile

> docker pull python

> docker pull jenkins

> docker pull mysql

> docker run -d -p 80:8080 python

> docker run -d -p 5000:5000 jenkins 

> docker run -d -p 3306:3306 mysql

> docker exce PYTHON_IMAGE __init__.py

> Dockerfile

### Ansible

![](pictures/ansible_1.jpeg)

>

>

>

>

## Risk Assessment

### MoSCoW report 

#### Must have ...
* Deploy app using docker and docker-compose
* Deploy app using Jenkins
* Test app on Jenkins
* Manage database using MySQL 
* Make test database using MySQL
* Use Webhooks on Jenkins to redeploy code 
* Use AWS to deploy code on the cloud
* Provision enviroment using Ansible Playbook
* Use NGINX to make a reverse proxy that hosts application 

#### Should have ...
* Software designs are made
* Use a version control system to manage code - Github, Gitlab, BitBucket
* Design for system 
* Logging of deployment of application

#### Could have ...
* Have .gitignore file 
* Logs written for backend
* Evolution of designs 

#### Would have ...
* Tests cover full CRUD application
* code quality is checked 
* Update and analysis of project

### Docker
|Description                                             |Assessment                                                                                                                                                                                                                                                                                                                                                                                     |Risk likelyhood of occuring (1=low to 10=high)|Impact (1- 10)|Responsiblity|Proposed Mitigration                                                                                                                                                                                                                                                                                                                                                                                 |Risk likelyhood of occuring (1 - 10)|Impact (1- 10)|
|--------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------|--------------|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------|--------------|
|Unsecured communication and unrestricted network traffic|By default, in some versions of Docker, all network traffic is allowed between containers on the same host. This increases the risk of unintended and unwanted disclosure of information to other containers. Developers should only allow intercommunication that is necessary by linking specific containers. This will significantly reduce attack surfaces by restricting container access.|3                                             |9             |Jake Stone   |To protect confidentiality and integrity of all network traffic, communications with Docker registries should be encrypted through TLS security protocol.                                                                                                                                                                                                                                            |1                                   |9             |
|Unrestricted access of process and files                |An attacker who gains access to one container may have the capability to gain access to other containers or the host.                                                                                                                                                                                                                                                                          |3                                             |9             |Jake Stone   |The access control best practice recommendations includes the principle of least privilege. The user namespace feature in Linux containers will allow developers to avoid root access by giving isolated containers separate user accounts, and mandate resource constraints, so users from one container do not have the capability to access other containers or exhaust all resources on the host.|3                                   |9             |
|Kernel level threats                                    |Docker is designed to have all containers share the same kernel and the host. This provides convenience but also amplifies the impact of any vulnerabilities present in the kernel.                                                                                                                                                                                                            |3                                             |10            |Jake Stone   |restrict applications that run on privileged ports besides the ones that are necessary (e.g. Apache server), since those ports have more access to the kernel.                                                                                                                                                                                                                                       |1                                   |10            |
|Inconsistent update and patching of docker containers   |Running an older version of Docker containers can expose internal IT environments to higher risks of breach                                                                                                                                                                                                                                                                                    |2                                             |5             |Jake Stone   |a patching policy should be in place and enforced.                                                                                                                                                                                                                                                                                                                                                   |0                                   |5             |
|Unverified docker images                                |Downloading images that are from an unknown source can lead to malware running on the kernel.                                                                                                                                                                                                                                                                                                  |1                                             |2             |Jake Stone   |download Docker images from trusted sources that are curated by the Docker community. Run vulnerability scans against those images before running them in the host environment.                                                                                                                                                                                                                      |1                                   |2             |

### Cloud Computing

|Description                                             |Assessment|Risk|Impact|Responsiblity|Current Mitigration|Proposed Mitigration|Respone|Tolorance|
|--------------------------------------------------------|----------|----|------|-------------|-------------------|--------------------|-------|---------|
|Executives must have oversight over the cloud           |Need to be able to make business decisions based off data from the cloud provider                                                                                                                                                                                                                                                                                                                                                                                                           |9                                             |2             |Jake Stone   |An oversight of the project is seen on github and progression of the project can be seen on Jira board. Over sight over the cloud can be seen on AWS can see how performance of computing resources is doing and can optimize based off data                                                                                                                                                         |9                                   |0             |
|Management must own the risks in the cloud              |Knowing about the risks before developing is always a positive                                                                                                                                                                                                                                                                                                                                                                                                                              |7                                             |6             |Jake Stone   |Learning about cloud at QA academy and cloud academy                                                                                                                                                                                                                                                                                                                                                 |7                                   |1             |
|All necessary staff must have knowledge of the cloud    |If working on something, a base level of compentence is always a help                                                                                                                                                                                                                                                                                                                                                                                                                       |4                                             |6             |Jake Stone   |I learn technologies of the cloud, which can be seen on Jira                                                                                                                                                                                                                                                                                                                                         |4                                   |1             |
|Best practices must be followed in the cloud            |People that have came before have ran into problems while developing solutions to the cloud, they must have spent many a long night thinking arguing the comprimies between security and speed; authenticaion requirements and ease of use. After these long thoughts they have come up with a set of requirments that they think are the most appropriate, therefore  as these are the most competent people in this area these practices should be followed unless can be reasoned against|5                                             |6             |Jake Stone   |AWS best sercurity practices read. Report to be written to show following of the AWS sercurity measures                                                                                                                                                                                                                                                                                              |5                                   |1             |
|data theft                                              |People can get to the data in a variety of ways e.g. SQL injection                                                                                                                                                                                                                                                                                                                                                                                                                          |10                                            |8             |AWS          |The data is stored on the sql database on a AWS VM                                                                                                                                                                                                                                                                                                                                                   |10                                  |1             |
|system compromise                                       |The system can go down due to a range of technical problems                                                                                                                                                                                                                                                                                                                                                                                                                                 |9                                             |9             |Jake Stone   |Use jenkins so if a container is to fail Jenkins, an continuous integration pipeline can restart a container                                                                                                                                                                                                                                                                                         |9                                   |2             |


### Database Risks

|Description                                             |Assessment|Risk|Impact|Responsiblity|Current Mitigration|Proposed Mitigration|Respone|Tolorance|
|--------------------------------------------------------|----------|----|------|-------------|-------------------|--------------------|-------|---------|
|Excessive privileges      |When a malicious user enters the system they will try and get the highest level of access as possible so they may steal the most valuable data. Also, there may be a disgruntled employee that would want to cause havoc if they had unrestricted privileges they could delete all the data.|0  |10 |Jake Stone|Prevention, use NGINX so application is under on IP address, use AWS and follow sercurity guide lines.Damage control use Principle of least privilege so that if event is to occur damage can be minimized                                                                                                                    |0  |1  |
|Legitimate privilege abuse|This is to distinguish between human imcompetence and deleting on purpose. There may be a worker whom, by mistake, deletes. shutsdown apart of the database.                                                                                                                           |7  |8  |Jake Stone|Make sure a back up of the data is kept so that if data is to be deleted back-up can be used                                                                                                                                                                                                                                  |7  |0  |
|Database injection attacks|This is can be done in many way, but the result is either the deletion of data or data being stolen.                                                                                                                                                                                   |3  |7  |AWS       |S3 bucket will be used to store data, they follow AWS sercurity guide lines.                                                                                                                                                                                                                                                  |1  |7  |
|Malware                   |A piece of software that acts to destroy or steal data from application.                                                                                                                                                                                                               |5  |8  |AWS       |Malware can only attack the EC2 machines the application will be running on. Reducing the likelyhood that Malware will be present on a machine is the responsiblity of AWS and they follow strict sercurity guidelines.                                                                                                       |1  |8  |
|Storage media exposure    |Back-ups of the data are normally left insurecure.                                                                                                                                                                                                                                     |5  |8  |AWS       |AWS will store all backups of data and therefore will be responsible for it. There could be an argument made that AWS could go down and having a backup of this data is could be vital in sercuring a higher market share, this is false if AWS was to go down people would no longer trust there information on the internet.|1  |8  |
|The human factor          |People thinking they know what they're doing and not doing the correct thing, so they enter the incorrect command and do something catastrphoic                                                                                                                                        |8  |10 |Jake Stone|Branching the project and having a test data base will allow for commands to be tested and put into development.                                                                                                                                                                                                              |8  |1  |

### Network

|Description                                             |Assessment|Risk|Impact|Responsiblity|Current Mitigration|Proposed Mitigration|Respone|Tolorance|
|--------------------------------------------------------|----------|----|------|-------------|-------------------|--------------------|-------|---------|
|Viruses and Worms                   |destructive malicious programs designed to infect core systems, destroying essential system data and making networks inoperable                                                                                               |5                                             |9             |Jake Stone   |Installing anti-malware solutions on all networked devices and systems can significantly reduce the possibility of contracting these viruses or allowing them to spread.                                                                                        |1                                   |9             |
|Botnets                             |powerful networks of compromised machines that can be remotely controlled and used to launch attacks of massive scale                                                                                                         |5                                             |9             |Jake Stone   |efense in this case requires a cooperative approach including working with your ISP, system software vendors, and law enforcement agencies.                                                                                                                     |1                                   |9             |
|Phishing Attacks                    |social engineering attack that is designed to steal user logins, credit card credentials, and other types of personal financial information.                                                                                  |5                                             |8             |Jake Stone   |train your users to always be cautious when reading and opening all emails                                                                                                                                                                                      |1                                   |8             |
|Exploit Kits                        |automated ways to exploit users systems                                                                                                                                                                                       |5                                             |9             |Jake Stone   |  Software solutions include antivirus and intrusion preventions systems, and human solutions include anti-phishing training for users.                                                                                                                         |1                                   |9             |
|DDoS (Distributed Denial of Service)|The purpose of these attacks is to overwhelm the hosted servers of their targets with requests for data, making them completely inoperable                                                                                    |5                                             |9             |Jake Stone   |Early detection is vital to protect your network effectively against a DDoS attack. WAFs (Web Application Firewalls) are a great tool to use against these attacks as they give you more control over your web traffic while recognizing malicious web exploits.|1                                   |9             |
|Ransomware                          |By infecting secure database systems, encrypting data, and threatening deletion or corruption of files                                                                                                                        |5                                             |10            |Jake Stone   |As ransomware is a form of malware, the same defensive strategies are required – antivirus software, keeping software updated with the latest security patches, and training employees to recognize phishing attacks.                                           |1                                   |10            |
|Cryptojacking                       |utilizing hardware resources from unsuspecting victims for their financial gain. hackers can use their target’s CPU processing resources to mine for cryptocurrency, significantly impacting the performance of their systems.|5                                             |5             |Jake Stone   |T teams should have methods to continuously monitor and diagnose CPU usage and alert to changes over time                                                                                                                                                       |1                                   |5             |

## References

1. https://www.cimcor.com/blog/the-top-5-security-risks-in-docker-container-deployment
2. https://www.isaca.org/resources/isaca-journal/past-issues/2012/cloud-risk-10-principles-and-a-framework-for-assessment
3. https://www.shrm.org/resourcesandtools/hr-topics/risk-management/pages/top-database-security-threats.aspx
4. https://securityfirstcorp.com/the-top-9-network-security-threats-of-2019/
5. https://aws.amazon.com/blogs/security/getting-started-follow-security-best-practices-as-you-configure-your-aws-resources/
6. https://searchaws.techtarget.com/tip/Perform-an-AWS-security-assessment-with-these-tips-and-tools