variable "aws_region" {
  type        = string
  default     = "eu-north-1"
}

variable "environment" {
  type        = string
  default     = "test"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.20.0.0/16"
}

variable "db_name" {
  type    = string
  default = "appdb"
}

variable "db_username" {
  type      = string
  default   = "app_admin"
  sensitive = true
}

variable "db_instance_class" {
  type    = string
  default = "db.t4g.micro"
}

variable "container_image" {
  type        = string
  default     = "366945364324.dkr.ecr.eu-north-1.amazonaws.com/practice/assessment"
}

variable "container_port" {
  type    = number
  default = 8000
}

variable "desired_count" {
  type    = number
  default = 1
}

