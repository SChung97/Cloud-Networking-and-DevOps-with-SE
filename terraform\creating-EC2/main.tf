# Creating an EC2 instance

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "first_instance" {
  # AMI Id
  ami = "ami-049442a6cf8319180"

  # what instance type?
  instance_type = "t3.micro"

  # add an auto-assigned public IP
  associate_public_ip_address = true

  # name instance on aws
  tags = {
    Name = "tech518-steph-terraform-basic-instance"
  }
}


