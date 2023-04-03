
## Table of Content
- Dockerise wordpress app
- CI/CD pipeline using terraform in AWS
- Infrastructure creation for ecs fargate

### Dockerise wordpress app
```
- Use php-apache as base image
- Install dependencies and set workdir
- Copy wordpress application code and set permissions
- Start apache in foreground inside container as pid(1) process

Note: Application Dockerfile path : app/Dockerfile
```

### CI/CD pipeline creation using terraform in AWS
```
Modules created to create pipeline are as follows
- Codecommit
- Codebuild
- Clouwatch-Events
```
## Basic CI/CD flow

<img src="image-assets/ci-cd-flow.png" alt="CI/CD flow" title="Employee Data title">

### Infrastructure creation for ecs fargate

```
Modules to create infra are as follows
- networking
- efs
- ecr
- rds
- secret-manager
- loadbalancer
- ecs
```

## Network Diagram

<img src="image-assets/network-diagram.png" alt="network diagram" title="Employee Data title">

## Modules Info

### networking : It will create following components
```
- VPC
- 3 public subnets spread across multiple az
- 3 private subnets spread across multiple az
- public route table with internet gateway
- elastic ip
- private route table with nat gateway
```
### efs : It will create following components
```
- efs
- efs security group
- mount point 
- access point
```

### ecr : It will create following components
```
- ecr registry
```

### rds : It will create following components
```
- db subnet group
- rds
```

### secret manager : It will create following components
```
- secret
```

### loadbalancer : It will create following components
```
- alb
- target group
- listeners
```

### ecs : It will create following components
```
- taskdefination
- ecs cluster
- ecs service
- autoscaling in ecs service
- task role
- task execution role
```

#### Note : terraform.vars is not added to this repo due to security concerns as it is a public repo.
