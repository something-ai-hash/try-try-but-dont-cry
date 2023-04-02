resource "aws_security_group" "ecs_tasks" {
  name        = "{var.environment}-ecs-sg"
  description = "Allow inbound access in port 80 only"
  vpc_id      = var.vpc_id

  ingress {
	protocol    = "tcp"
	from_port   = 80
	to_port     = 80
	security_groups = ["${var.lb_security_group_id}"]
  }

  egress {
	protocol    = "-1"
	from_port   = 0
	to_port     = 0
	cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "{var.environment}-ecs-sg"
  }
}