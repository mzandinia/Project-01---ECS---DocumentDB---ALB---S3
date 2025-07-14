output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

# ECR outputs
output "repository_url" {
  description = "URL of the ECR repository"
  value       = module.ecr.repository_url
}

output "cluster_endpoint" {
  description = "The connection endpoint for the DocumentDB cluster"
  value       = module.docdb.cluster_endpoint
}

output "frontend_bucket_name" {
  description = "The name of the S3 bucket hosting the frontend"
  value       = aws_s3_bucket.frontend_bucket.id
}
