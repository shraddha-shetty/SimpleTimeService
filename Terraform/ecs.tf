resource "aws_ecs_cluster" "main" {
  name = "simple-time-cluster"
}

resource "aws_ecs_task_definition" "simple_time" {
  family                   = "simple-time"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name  = "simple-time"
      image = var.docker_image_uri
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "simple_time_service" {
  name            = "simple-time-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.simple_time.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = [aws_subnet.private_1.id, aws_subnet.private_2.id]
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.simple_time_tg.arn
    container_name   = "simple-time"
    container_port   = 8080
  }

  depends_on = [aws_lb_listener.http]
}
