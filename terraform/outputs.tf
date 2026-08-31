output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_dns_name" {
  description = "Public URL of the application"
  value       = module.ecs.alb_dns_name
}

output "rds_endpoint" {
  value     = module.rds.endpoint
  sensitive = true
}

output "ecr_repository_url" {
  value = module.ecs.ecr_repository_url
}
