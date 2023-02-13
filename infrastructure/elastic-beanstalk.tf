resource "aws_elastic_beanstalk_application" "multi-docker" {
  name = "multi-docker"
}

output "eba_id" {
  value = aws_elastic_beanstalk_application.multi-docker.id
}

resource "aws_elastic_beanstalk_environment" "multi-docker" {
  name        = "Multidockergh-env"
  application = aws_elastic_beanstalk_application.multi-docker.id
  solution_stack_name = "64bit Amazon Linux 2 v3.5.4 running Docker"
}

output "ebe_id" {
  value = aws_elastic_beanstalk_environment.multi-docker.id
}
