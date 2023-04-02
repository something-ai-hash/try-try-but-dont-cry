resource "aws_db_instance" "rds" {
  allocated_storage      = var.db_allocated_storage
  db_name                = var.db_name
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  username               = var.db_username
  password               = random_string.password.result
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot    = var.db_skip_final_snapshot
  db_subnet_group_name   = aws_db_subnet_group.rds.id
  tags                   = {
    Name = "${var.environment}-rds"
  }
}

resource "random_string" "password" {
  length    = 16
}

resource "aws_db_subnet_group" "rds" {
  name        = "${var.environment}-sg-rds"
  description = "private subnets added to subnet group"
  subnet_ids  = var.private_subnets_id
}