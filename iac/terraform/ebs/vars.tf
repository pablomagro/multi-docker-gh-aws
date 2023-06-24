variable "aws_region" {
  type    = string
  default = "ap-southeast-2"
}
variable "elasticapp" {
  default = "multi-docker-gh"
}
variable "beanstalkappenv" {
  default = "multi-docker-gh-env"
}
variable "solution_stack_name" {
  type = string
}
variable "tier" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "asg_minsize" {
  type = number
}
variable "asg_maxsize" {
  type = number
}

variable "vpc_id" {}
variable "vpc_default_security_group" {
  type    = string
  default = "sg-fb60ac8e"
}
variable "public_subnets" {}
variable "elb_public_subnets" {}