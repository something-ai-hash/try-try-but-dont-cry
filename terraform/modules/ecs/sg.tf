resource "aws_security_group" "ecs_tasks" {
  name        = "{var.environment}-ecs-sg"
  description = "Allow inbound access in port 80 only"
  vpc_id      = var.vpc_id

  ingress {
	protocol    = "-1"
	from_port   = 0
	to_port     = 0
	cidr_blocks = ["0.0.0.0/0"]
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