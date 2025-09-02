variable "desired_count" {
  type = number
  default = 1
}

variable "container_image" {
  type = string
  default = "nginx"
}

variable "container_port" {
  type = number
  default = 80
}

variable "vpc_id" {
  description = "The ID of the VPC where the ECS cluster will be deployed."
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs for ECS tasks."
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet IDs for ECS load balancers."
  type        = list(string)
}