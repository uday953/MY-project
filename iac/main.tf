terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}

variable "region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "repo_name" {
  description = "ECR repository name"
  type        = string
  default     = "demo-node-app-repo"
}

resource "aws_ecr_repository" "app" {
  name                 = var.repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Project = "demo-node-app"
    Env     = "dev"
  }
}

resource "aws_ecs_cluster" "demo" {
  name = "demo-cluster"
}

output "ecr_repository_url" {
  description = "ECR repository URI"
  value       = aws_ecr_repository.app.repository_url
}

output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.demo.name
}
