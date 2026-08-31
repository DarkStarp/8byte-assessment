resource "aws_security_group" "app" {
  name   = "${var.environment}-app-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "vpc" {
  source = "./modules/vpc"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr
}

module "ecs" {
  source = "./modules/ecs"

  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  app_sg_id          = aws_security_group.app.id
  container_image    = var.container_image
  container_port     = var.container_port
  desired_count      = var.desired_count
}

module "rds" {
  source = "./modules/rds"

  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  db_subnet_ids     = module.vpc.private_subnet_ids
  app_sg_id         = aws_security_group.app.id
  db_name           = var.db_name
  db_username       = var.db_username
  db_instance_class = var.db_instance_class
}
