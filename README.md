# Practical Project 

## SFIA assessment 2 

- [Introduction](#Introduction)
- [Infrastucture](#Infrastructure)
- [Testing](#Testing)
- [Database](#Database)
- [Risk_Assessment](#Risk_Assessment)

## Introduction 
## Infastructure
## Testing 
## Database
## Planning
## Risk_Assessment

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

#### Could have ...
*


#### Would have ...
*

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


### Database

|Description                                             |Assessment|Risk|Impact|Responsiblity|Current Mitigration|Proposed Mitigration|Respone|Tolorance|
|--------------------------------------------------------|----------|----|------|-------------|-------------------|--------------------|-------|---------|
|Database Manipulation                                   |          |    |      |             |                   |                    |       |         |
|Database corruption                                     |          |    |      |             |                   |                    |       |         |
|Excessive privileges                                    |          |    |      |             |                   |                    |       |         |
|Legitimate privilege abuse                              |          |    |      |             |                   |                    |       |         |
|Database injection attacks                              |          |    |      |             |                   |                    |       |         |
|Malware                                                 |          |    |      |             |                   |                    |       |         |
|Storage media exposure                                  |          |    |      |             |                   |                    |       |         |
|The human factor                                        |          |    |      |             |                   |                    |       |         |

### Network

|Description                                             |Assessment|Risk|Impact|Responsiblity|Current Mitigration|Proposed Mitigration|Respone|Tolorance|
|--------------------------------------------------------|----------|----|------|-------------|-------------------|--------------------|-------|---------|
|Network penetration                                     |          |    |      |             |                   |                    |       |         |
|Viruses and Worms                                       |          |    |      |             |                   |                    |       |         |
|Drive-by Download Attacks                               |          |    |      |             |                   |                    |       |         |
|Botnets                                                 |          |    |      |             |                   |                    |       |         |
|Phishing Attacks                                        |          |    |      |             |                   |                    |       |         |
|Exploit Kits                                            |          |    |      |             |                   |                    |       |         |
|DDoS (Distributed Denial of Service)                    |          |    |      |             |                   |                    |       |         |
|Ransomware                                              |          |    |      |             |                   |                    |       |         |
|Cryptojacking                                           |          |    |      |             |                   |                    |       |         |
|APT Threats                                             |          |    |      |             |                   |                    |       |         |

## References

1. https://www.cimcor.com/blog/the-top-5-security-risks-in-docker-container-deployment
2. https://www.isaca.org/resources/isaca-journal/past-issues/2012/cloud-risk-10-principles-and-a-framework-for-assessment
3. https://www.shrm.org/resourcesandtools/hr-topics/risk-management/pages/top-database-security-threats.aspx
4. https://securityfirstcorp.com/the-top-9-network-security-threats-of-2019/
5. https://aws.amazon.com/blogs/security/getting-started-follow-security-best-practices-as-you-configure-your-aws-resources/
6. https://searchaws.techtarget.com/tip/Perform-an-AWS-security-assessment-with-these-tips-and-tools
