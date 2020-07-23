# jenkins-java-test-pipeline

Template for a Jenkins-Java pipeline. <br/>
My implementation is based on the course: Jenkins, from Zero To Hero: Become a DevOps Jenkins Master:
https://www.udemy.com/course/jenkins-from-zero-to-hero <br/>

I have made a couple of changes to make the project more concise and easier to reuse. <br/>
Can be used as a reference for setting up a CI/CD environment. <br/>

## Workflow of the pipeline
The pipeline consists of several stages:
- cloning the codebase
- building a docker image
- running tests
- pushing the image to dockerhub
- deploying the app on a remote server, by pulling the image and running docker-compose

![alt text](https://github.com/szymonstuszek/jenkins-java-test-pipeline/blob/master/jenkins.PNG)



## Setup
Pipelines can be configured in many different ways. In this particular example I have used the EC2 service from AWS to setup the environment. <br/>
As a starting point you should have a github repository and an account at dockerhub. <br/>
I have launched 2 Linux servers, one to host the Jenkins server and the second to be the production machine,
where the app is deployed. Both of them have docker installed. <br/>
To setup the pipeline you will need to configure some variables:
- username and password to dockerhub: needed for pushing the images and pulling them on the prod machine
- name of the user for the prod machine and it's ip address
- workspace: the jenkins server is run within a container and it is mounted to the host machine by a volume, you need to pass the path to the current job
- keyId: variable to store a reference to a ssh key, needed to connect to the prod machine
- image: name of your docker image

## Notes
Permission issues: when setting up a jenkins server to access the docker.sock on the host, you will most likely run into permission issues, I've tried to add the jenkins user to the docker group, but without success. A workaround is to change the permission of the docker.sock so that all of the users can access it, which again is not that secure. <br/>
A further issue here was that after rebooting the machine the permissions were gone, which I solved by writing a script, which was executed on boot to modify the permissions. <br/>
Transfering variables to the prod machine: most likely not the most secure way, I did it according to the tutorial, a better solution would be to use for example AWS Secret Management Service.

## Technologies
 - Java 8
 - Jenkins
 - Maven
 - Docker
 - Docker-Compose
 - Bash
 - AWS: EC2, S3
 
