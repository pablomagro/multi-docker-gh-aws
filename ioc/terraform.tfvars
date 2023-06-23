# Variables values

vpc_id              = "vpc-f4858893"
instance_type       = "t2.micro"
minsize             = 1
maxsize             = 2
public_subnets      = ["subnet-3f0b6c67	", "subnet-4eca2c06"] # Service Subnet
elb_public_subnets  = ["subnet-3f0b6c67	", "subnet-4eca2c06"] # ELB Subnet
tier                = "WebServer"
# solution_stack_name = "Docker AL2 version 3.5.8"
solution_stack_name = "64bit Amazon Linux 2 v3.5.8 running Docker"