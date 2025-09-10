variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "container_image" {
  type    = string
  default = "654654428802.dkr.ecr.us-east-1.amazonaws.com/simple-web-app"
}

variable "image_version" {
  type = string
  default = "v1.0.0"
}

variable "container_port" {
  type    = number
  default = 80
}