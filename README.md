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
The setup for a pipeline can be configured in many ways.


## Technologies
 - Java 8
 - Jenkins
 - Maven
 - Docker
 - Docker-Compose
 - Bash
 - AWS
 
