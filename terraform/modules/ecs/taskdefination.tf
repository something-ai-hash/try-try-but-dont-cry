
resource "aws_ecs_task_definition" "task" {
  family                   = "wordpress"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode([
	{
	  name             = "${var.environment}-wordpress-cd"
	  essential        = true
    cpu              = var.container_cpu
    memory           = var.container_memory
	  image            = "${var.repository_url}:${var.image_tag}"
    secrets: [
      {
      name: "WORDPRESS_DB_HOST",
      valueFrom: "arn:aws:secretsmanager:${var.region}:${var.account_id}:secret:${var.secret_name}:dbhost::"
      },
      {
        name: "WORDPRESS_DB_USER",
        valueFrom: "arn:aws:secretsmanager:${var.region}:${var.account_id}:secret:${var.secret_name}:dbuser::"
      },
      {
        name: "WORDPRESS_DB_PASSWORD",
        valueFrom: "arn:aws:secretsmanager:${var.region}:${var.account_id}:secret:${var.secret_name}:dbpassword::"
      },
      {
        name: "WORDPRESS_DB_NAME",
        valueFrom: "arn:aws:secretsmanager:${var.region}:${var.account_id}:secret:${var.secret_name}:dbname::"
      }
    ]
	  logConfiguration = {
		logDriver = "awslogs"
		options   = {
		  awslogs-group         = aws_cloudwatch_log_group.log_group.name
		  awslogs-region        = var.region
		  awslogs-stream-prefix = "ecs"
		}
	  }
	  portMappings     = [
		{
		  hostPort      = var.hostport
		  containerPort = var.containerport
		  protocol      = "tcp"
		}
	  ]
    /*
      mountPoints     = [{
      sourceVolume  = "wordpress-storage"
      containerPath = "/uploads"
      readOnly      = true
    }]
    */
	}
  ])
  /*
  volume {
    name                    = "wordpress-storage"
    
    efs_volume_configuration {
      file_system_id          = var.efs_id
      root_directory          = "/"
      transit_encryption      = "ENABLED"
      authorization_config {
        access_point_id = var.access_point_id
        iam             = "DISABLED"
      }
    }
  }
  */
}