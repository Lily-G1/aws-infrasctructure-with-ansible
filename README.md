# aws-infrasctructure-with-ansible  
## creation of an AWS infrastructure using Ansible configuration tool    

This is an ansible playbook that creates a custom VPC in AWS with private EC2 instances, a NAT instance to route internet access to instances and a load balancer
 that manages traffic between them  

Details:  
This directory contains the following:  

vpc.yml: The playbook. Run this file to deploy project on AWS  
A hosts file  
user_data.sh: Contains a bash script that installs & configures Nginx & PHP on private servers (via user data). Also displays their respective hostnames on-screen  
