# Create an Application Load Balancer
resource "aws_lb" "simple_time_service_lb" {
  name               = "simple-time-service-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]  # Deploy in public subnets
  security_groups    = [aws_security_group.alb_sg.id]
}

# Define a target group for ECS service                         
resource "aws_lb_target_group" "simple_time_tg" {
  name     = "simple-time-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  target_type = "ip"

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

# Create a listener on port 80 to forward traffic to the target group
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.simple_time_service_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.simple_time_tg.arn
  }
}
