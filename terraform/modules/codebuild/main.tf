resource "aws_codebuild_project" "codebuild" {
  name = "${var.environment}-codebuild"
  service_role = aws_iam_role.codebuild.arn
  source {
    type            = "CODECOMMIT"
    location        = var.repo_url
    buildspec = <<-EOF
      version: 0.2

      phases:
        pre_build:
          commands:
            - echo "Logging in to Amazon ECR..."
            - aws ecr get-login-password | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com
        build:
          commands:
            - echo "Building the Docker image..."          
            - docker build -t $IMAGE_REPO_NAME:$IMAGE_TAG .
            - docker tag $IMAGE_REPO_NAME:$IMAGE_TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME:$IMAGE_TAG
        post_build:
          commands:
            - echo Build completed on `date`
            - echo Pushing the Docker image...
            - docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME:$IMAGE_TAG
            - sleep 5s
            - aws ecs update-service --cluster $ECS_CLUSTER --service $ECS_SERVICE --force-new-deployment
  EOF
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:4.0"
    type         = "LINUX_CONTAINER"
    privileged_mode = true

    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = "${var.account_id}"
    }

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = "${var.region}"
    }

    environment_variable {
      name  = "IMAGE_REPO_NAME"
      value = "${var.repo_name}"
    }

    environment_variable {
      name  = "IMAGE_TAG"
      value = "latest"
    }

    environment_variable {
      name  = "ECS_CLUSTER"
      value = "${var.ecs_cluster_name}"
    }

    environment_variable {
      name  = "ECS_SERVICE"
      value = "${var.ecs_service_name}"
    }

  }

  artifacts {
    type = "NO_ARTIFACTS"
  }
  
}

data "aws_caller_identity" "current" {}


