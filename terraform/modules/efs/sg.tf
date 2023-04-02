resource "aws_security_group" "efs" {
   name = "${var.environment}-efs-sg"
   description= "Allow inbound efs traffic from vpc"
   vpc_id = var.vpc_id

   ingress {
     cidr_blocks = ["${var.vpc_cidr}"]
     from_port = 0
     to_port = 0
     protocol = "-1"
   }     
        
   egress {
     cidr_blocks = ["${var.vpc_cidr}"]
     from_port = 0
     to_port = 0
     protocol = "-1"
   }

   tags = {
    Name = "${var.environment}-efs-sg"
  }
 }