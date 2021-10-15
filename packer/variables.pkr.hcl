variable "skip_create_ami" {
  type = string
  default = "true"
}

variable "aws_region" {
  type = string
  default = "us-east-2"  
}

variable "aws_access_key" {
  type      = string
  default   = ""
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  default   = ""
  sensitive = true
}

variable "ami_name"{
  type = string
  default = "firefly-ami"
}

variable "instance_type" {
  type = string
  default = "t2.medium"
}

variable "ssh_username" {
  type = string
  default = "ubuntu"
}

variable "vpc_id" {
  type = string
  default = ""
}

variable "subnet_id" {
  type = string
  default = ""
}
