resource "aws_elasticache_subnet_group" "main" {
  name       = "multi-docker-redis-group"
  subnet_ids = ["subnet-4eca2c06", "subnet-b86792de", "subnet-3f0b6c67"]
}

resource "aws_elasticache_parameter_group" "main" {
  name   = "default.redis7"
  family = "redis7"
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "multi-docker-redis-001"
  engine               = "redis"
  engine_version       = "7.0"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = aws_elasticache_parameter_group.main.name
  port                 = 6379
  security_group_ids   = [module.multi_docker_sg_module.sg_id]
  subnet_group_name    = aws_elasticache_subnet_group.main.name
}

output "redis_endpoint_name" {
  value = aws_elasticache_cluster.redis.cache_nodes[0]["address"]
}
