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

variable "vpc_id" {}
variable "public_subnets" {}
variable "elb_public_subnets" {}