resource "aws_ecs_cluster" "cluster" {
  name = "${var.environment}-cluster"
  tags = {
    Name = "${var.environment}-cluster"
  }
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "${var.environment}-cluster"
  tags = {
    Name = "${var.environment}-cluster"
  }
}

resource "aws_ecs_service" "service" {
  name            = "${var.environment}-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
	security_groups  = [aws_security_group.ecs_tasks.id]
	subnets          = var.private_subnets_id
	assign_public_ip = false
  }

  load_balancer {
   target_group_arn = var.target_group_arn
   container_name   = "${var.environment}-wordpress-cd"
   container_port   = var.hostport
 }

  tags = {
    Name = "${var.environment}-service"
  }
}