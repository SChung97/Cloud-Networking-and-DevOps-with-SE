# Deploying app EC2 instance

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "app_instance" {
  
  ami = var.ami_id

  instance_type = var.instance_type

  associate_public_ip_address = true

  #key pair
  key_name = var.key_name

  # adding security group
  vpc_security_group_ids = [var.security_group]

  # adding user data to deploy app home page without db
  user_data = file("${path.module}/deploy_app.sh")

  tags = {
    Name = "tech518-steph-terraform-app-instance"
  }

}

