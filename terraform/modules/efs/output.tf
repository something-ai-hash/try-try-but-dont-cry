output "efs_id" {
  value = aws_efs_file_system.efs.id
}

output "access_point_id" {
  value = aws_efs_access_point.efs-ap.id
}