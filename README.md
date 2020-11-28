# Udacity Cloud DevOps Capstone project
CI/CD setup to deploy a microservice application using Jenkins, Docker and Amazon EKS (Elastic Kubernetes Service)

# Project Scope:
The scope of the project is to print the top news article's title and summary from a leading news site (in this case, bbc.com/news). 
For this purpose, the newspaper library (source https://github.com/codelucas/newspaper), which is a Python-based library, is used for extracting and summarizing the article.

# Project Approach:

The application code is written in Python based on newspaper library. 
Jenkins is used for rolling deployment. 
Docker is used for containerization of application. 
Amazon EKS is used for creating the cluster using eksctl utility as it is able to create a cluster in minutes with a single command. 
It uses AWS CloudFormation.

# Project Setup:

Amazon EC2 instance of Ubuntu 18.04 is used for setting up Jenkins box. 
Below article is referred for installation & setup: 
https://medium.com/@andresaaap/how-to-install-docker-aws-cli-eksctl-kubectl-for-jenkins-in-linux-ubuntu-18-04-3e3c4ceeb71 


# Commands used to create cluster: 

eksctl create cluster --name capstoneclustersanupam --version 1.16 --nodegroup-name standard-workers 
--node-type t2.micro --nodes 3 --nodes-min 1 --nodes-max 4 --node-ami auto --region ap-south-1
