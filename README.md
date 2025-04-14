# SimpleTimeService (Python)

Returns current IST timestamp and requester's IP in JSON.
Built with Python, containerized with Docker, and deployable to AWS using Terraform.

# Purpose

This project demonstrates:
- Building a minimal RESTful microservice
- Dockerizing and publishing an image with container best practices (non-root user, slim image)
- Deploying infrastructure using Terraform on AWS

# Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Python 3.9](https://www.python.org/downloads/) (for local testing)

# RUN

```bash
docker build -t simpletimeservice .
docker run -p 8080:8080 simpletimeservice
>>>>>>> cce15b3... Initial commit with SimpleTimeService application and Dockerfile
