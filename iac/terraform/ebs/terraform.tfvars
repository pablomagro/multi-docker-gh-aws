# Variables values

vpc_id              = "vpc-f4858893"
instance_type       = "t2.micro"
asg_minsize         = 1
asg_maxsize         = 1
public_subnets      = ["subnet-4eca2c06", "subnet-b86792de", "subnet-3f0b6c67"] # Service Subnet
elb_public_subnets  = ["subnet-4eca2c06", "subnet-b86792de", "subnet-3f0b6c67"] # ELB Subnet
tier                = "WebServer"
solution_stack_name = "64bit Amazon Linux 2 v3.5.8 running Docker"