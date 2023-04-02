resource "aws_efs_file_system" "efs" {
   creation_token = "efs"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
   tags = {
     Name = "${var.environment}-efs"
   }
 }

 resource "aws_efs_mount_target" "efs-mt" {
   count = length(var.private_subnets_id)
   file_system_id  = aws_efs_file_system.efs.id
   subnet_id = element(var.private_subnets_id, count.index)
   security_groups = [aws_security_group.efs.id]
 }

 resource "aws_efs_access_point" "efs-ap" {
  file_system_id = aws_efs_file_system.efs.id
  posix_user {
    gid = 1000
    uid = 1000
  }
  root_directory {
    path = "/wp-contents"
    creation_info {
        owner_uid = 1000
        owner_gid = 1000
        permissions = 0777
    }
  }
 }
