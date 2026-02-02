output "blue_target_group_arn" {
  value = aws_lb_target_group.blue.arn
}

output "load_balancer_dns" {
  value = aws_lb.main.dns_name
}