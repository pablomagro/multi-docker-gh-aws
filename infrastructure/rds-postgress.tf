resource "aws_db_instance" "db1" {
  identifier             = "multi-docker-postgres"
  db_name                = "fibvalues"
  engine                 = "postgres"
  engine_version         = "12.13"
  instance_class         = "db.t2.micro"
  username               = "postgres"
  password               = "postgrespassword"
  option_group_name      = "default:postgres-12"
  parameter_group_name   = "default.postgres12"
  skip_final_snapshot    = true
  allocated_storage      = 20
  max_allocated_storage  = 1000
  storage_type           = "gp2"
  vpc_security_group_ids = ["sg-fb60ac8e"]
  tags                   = {}
}
