resource "aws_elasticache_subnet_group" "main" {
  name       = "multi-docker-redis-group"
  subnet_ids = var.public_subnets
}

resource "aws_elasticache_parameter_group" "main" {
  name   = "default-redis7"
  family = "redis7"
}

resource "aws_elasticache_cluster" "redis" {
  depends_on           = [aws_security_group.multi_docker_gh]
  cluster_id           = "multi-docker-redis"
  engine               = "redis"
  engine_version       = "7.0"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = aws_elasticache_parameter_group.main.name
  port                 = 6379
  security_group_ids   = [aws_security_group.multi_docker_gh.id]
  subnet_group_name    = aws_elasticache_subnet_group.main.name
}

output "redis_endpoint_name" {
  value = aws_elasticache_cluster.redis.cache_nodes[0]["address"]
}
