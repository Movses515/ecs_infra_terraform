variable "aws_region" {
  type = string
  default = "us-east-1"
}

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