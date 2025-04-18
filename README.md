# SimpleTimeService (Python)

This project is a simple microservice that provides the current date, time, and the IP address of the visitor in a JSON format.
It is implemented using Python and Dockerized for containerized deployment.

# Overview
The application listens on port 8080.
When a user visits the root URL (/), it returns the current timestamp and the user's IP address in the following JSON format:
 ```json
{
  "timestamp": "2025-04-14 15:10:37",
  "ip": "127.0.0.1"
}
```
# Technologies Used
**Python:** The application is written in Python and uses Python's http.server to serve HTTP requests.

**Docker:** The service is containerized using Docker. Docker allows us to package the application with its dependencies into a single, portable container.

**JSON:** The response from the application is returned as a JSON object

**Terraform:** Used to provision and manage AWS infrastructure as code.

**AWS:** Terraform deploys the microservice using AWS EC2 and related resources.

**AWS ECS + ALB:** Runs the container in a scalable and accessible setup

**IAM, VPC, Security Groups:** Infrastructure components provisioned via Terraform modules

# Purpose

This project demonstrates:
- Building a minimal RESTful microservice
- Dockerizing and publishing an image with container best practices (non-root user, slim image)
- Deploying infrastructure using Terraform on AWS

# Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Python 3.9](https://www.python.org/downloads/) (for local testing)
- [Git](https://git-scm.com/downloads)
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

## AWS Credential Setup 
Terraform needs access to your AWS account.
### Option 1: Use AWS CLI to configure credentials (Recommended)
```bash
aws configure
```
Provide your:
AWS Access Key ID

AWS Secret Access Key

Default region (e.g., us-east-1)

Output format (e.g., json)

This stores credentials in ``` ~/.aws/credentials ``` and Terraform will use them automatic

# Deployment Guide
## Option 1: Run the App Locally Using Docker

## 1. Clone the Repository
First, you need to clone the project repository to your local machine. Open a terminal and run the following command:

```bash
git clone https://github.com/shraddha-shetty/SimpleTimeService.git
```
This will create a folder named SimpleTimeService with all the necessary files.

## 2. Navigate to the Project Directory
Change your working directory to the cloned project folder:

```bash
cd SimpleTimeService
```
## 3. Build the Docker Image
```bash
docker build -t simpletimeservice .
```
This command will create a Docker image named simpletimeservice based on the Dockerfile in the project.

## 4. Run the Docker Container
```bash
docker run -p 8080:8080 simpletimeservice
```
• This will run the container and map port 8080 inside the container to port 8080 on your machine.

• The application will be available at http://localhost:8080

## Option 2: Deploy the App to AWS Using Terraform
## 1. Navigate to Terraform Folder
```bash
cd terraform
```
## 2. Initialize Terraform 
```bash
terraform init
```
##  3. View the Plan 
```bash
terraform plan
```
## 4. Apply the Infrastructure
```bash
terraform apply
```
• After apply is complete, Terraform will show the output like this

```alb_dns_name = http://simple-time-service-lb-1234567890.us-east-1.elb.amazonaws.com```

Open this in your browser. You’ll see the current server time!

### Tearing Down the Infrastructure
When you're done, remove all AWS resources to avoid charges:
```bash
terraform destroy
```
# Repository Structure
Here is a quick overview of the project structure:
```bash
SimpleTimeService/
├── app/
│   └── main.py                # Python app code
├── Dockerfile                 # Docker image configuration
├── .dockerignore              # Docker ignore file
├── README.md                  # This documentation
└── Terraform/                 # All infrastructure code (Task 2)
    ├── alb.tf                 # Load balancer config
    ├── ecs.tf                 # ECS cluster and service definition
    ├── iam.tf                 # IAM roles and policies
    ├── main.tf                # Main entry point for Terraform
    ├── network.tf             # Subnets, IGWs, route tables
    ├── outputs.tf             # Outputs like ECS/ALB IPs
    ├── security.tf            # Security groups
    ├── variables.tf           # All input variables
    └── vpc.tf                 # VPC definition
```

         
