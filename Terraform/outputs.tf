output "load_balancer_dns" {
  description = "DNS name of the Load Balancer"
  value       = aws_lb.simple_time_service_lb.dns_name
}
