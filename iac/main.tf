# https://github.com/cloudposse/terraform-aws-elastic-beanstalk-environment/blob/main/main.tf
# Create elastic beanstalk application

resource "aws_elastic_beanstalk_application" "elasticapp" {
  name = var.elasticapp
}
output "elasticapp_id" {
  value = aws_elastic_beanstalk_application.elasticapp.id
}

# Create elastic beanstalk Environment

resource "aws_elastic_beanstalk_environment" "beanstalkappenv" {
  name                = var.beanstalkappenv
  application         = aws_elastic_beanstalk_application.elasticapp.name
  solution_stack_name = var.solution_stack_name
  tier                = var.tier
  depends_on          = [aws_security_group.multi_docker_gh, aws_elasticache_cluster.redis, aws_db_instance.portgres_fb]

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "true"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",", var.public_subnets)
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "MatcherHTTPCode"
    value     = "200"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "internet facing"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.asg_minsize
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.asg_maxsize
  }

  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "enhanced"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = join(",", [var.vpc_default_security_group, aws_security_group.multi_docker_gh.id])
    resource  = ""
  }
  # setting {
  #   namespace = "aws:cloudformation:template:parameter"
  #   name      = "SysEnvironmentVariablestemType"
  #   value     = "REDIS_HOST=${aws_elasticache_cluster.redis.cache_nodes[0]["address"]},PGHOST=postgres,REDIS_PORT=6379,PGUSER=postgres,PGPORT=5432,PGPASSWORD=postgrespassword,PGDATABASE=fibvalues"
  # }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "REDIS_HOST"
    value     = aws_elasticache_cluster.redis.cache_nodes[0]["address"]
  }
  setting {
    name      = "REDIS_PORT"
    namespace = "aws:elasticbeanstalk:application:environment"
    value     = "6379"
  }
  setting {
    name      = "PGDATABASE"
    namespace = "aws:elasticbeanstalk:application:environment"
    value     = "fibvalues"
  }
  setting {
    name      = "PGHOST"
    namespace = "aws:elasticbeanstalk:application:environment"
    value     = aws_db_instance.portgres_fb.address
  }
  setting {
    name      = "PGPASSWORD"
    namespace = "aws:elasticbeanstalk:application:environment"
    value     = "postgrespassword"
  }
  setting {
    name      = "PGPORT"
    namespace = "aws:elasticbeanstalk:application:environment"
    value     = "5432"
  }
  setting {
    name      = "PGUSER"
    namespace = "aws:elasticbeanstalk:application:environment"
    value     = "postgres"
  }
}

output "beanstalkappenv_id" {
  value = aws_elastic_beanstalk_environment.beanstalkappenv.id
}
