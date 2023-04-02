resource "aws_security_group" "rds" {
  name        = "${var.environment}-rds-sg"
  description = "Allow inbound rule for port 3306 only"
  vpc_id      = var.vpc_id

  ingress {
	protocol        = "tcp"
	from_port       = var.db_port
	to_port         = var.db_port
	cidr_blocks     = ["${var.vpc_cidr}"]
  }

  egress {
	protocol    = "-1"
	from_port   = 0
	to_port     = 0
	cidr_blocks = ["${var.vpc_cidr}"]
  }

  tags = {
    Name = "${var.environment}-rds-sg"
  }
}