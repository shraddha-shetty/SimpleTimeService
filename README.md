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

# Purpose

This project demonstrates:
- Building a minimal RESTful microservice
- Dockerizing and publishing an image with container best practices (non-root user, slim image)
- Deploying infrastructure using Terraform on AWS

# Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Python 3.9](https://www.python.org/downloads/) (for local testing)
- [Git](https://git-scm.com/downloads)

# Installation Instructions
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

# Repository Structure
Here is a quick overview of the project structure:
```bash
SimpleTimeService/
├── app/
│   └── main.py              # The main Python code for the web service
├── Dockerfile               # The Dockerfile used to build the Docker image
└── README.md                # The documentation for this project
```

         
