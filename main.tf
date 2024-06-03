# main.tf

provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = var.instance_name
  }
}

# Variables
variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of the instance"
  type        = string
}

variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
}

variable "volume_size" {
  description = "The size of the root volume in GB"
  type        = number
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}

output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.example.id
}
