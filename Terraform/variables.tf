# Variable for Docker image URI to be deployed to ECS
variable "docker_image_uri" {
  description = "Docker image URI"
  type        = string
  default     = "shradshetty/simpletimeservice:latest"
}
