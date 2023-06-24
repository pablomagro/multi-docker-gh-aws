resource "aws_db_instance" "portgres_fb" {
  depends_on                          = [aws_security_group.multi_docker_gh]
  allocated_storage                   = 20
  auto_minor_version_upgrade          = true
  backup_retention_period             = 1
  ca_cert_identifier                  = "rds-ca-2019"
  copy_tags_to_snapshot               = true
  db_name                             = "fibvalues"
  db_subnet_group_name                = "default"
  delete_automated_backups            = true
  deletion_protection                 = false
  engine                              = "postgres"
  engine_version                      = "14.7"
  iam_database_authentication_enabled = false
  identifier                          = "multi-docker-gh-postgres"
  instance_class                      = "db.t3.micro"
  iops                                = 0
  license_model                       = "postgresql-license"
  max_allocated_storage               = 1000
  monitoring_interval                 = 0
  multi_az                            = false
  network_type                        = "IPV4"
  option_group_name                   = "default:postgres-14"
  parameter_group_name                = "default.postgres14"
  username                            = "postgres"
  password                            = "postgrespassword"
  port                                = 5432
  publicly_accessible                 = false
  skip_final_snapshot                 = true
  storage_encrypted                   = true
  storage_throughput                  = 0
  storage_type                        = "gp2"
  vpc_security_group_ids              = [aws_security_group.multi_docker_gh.id]
  tags                                = {}
}

output "database_hostname" {
  value = aws_db_instance.portgres_fb.endpoint
}

