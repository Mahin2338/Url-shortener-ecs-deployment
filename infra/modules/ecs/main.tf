resource "aws_ecs_cluster" "main" {
  name = "url-shortener-cluster"

  tags = {
    Name = "url-shortener-cluster"
  }
}

resource "aws_cloudwatch_log_group" "app" {
name              = "url-shortener"
retention_in_days = 7 

tags = {
Name = "url-shortener-logs"
}
}



resource "aws_ecs_task_definition" "url-shortener" {
family = "url-shortener"
requires_compatibilities = ["FARGATE"]
network_mode = "awsvpc"
cpu = "256"
memory = "512"

container_definitions = jsonencode([
{
name      = "url-shortener"
image     = var.container-image
cpu       = 256
memory    = 512
essential = true
portMappings = [
{
containerPort = 8080
hostPort      = 8080
}
]
}
])
}