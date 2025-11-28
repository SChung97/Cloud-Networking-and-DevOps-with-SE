provider "aws" {
region = "eu-west-1
}

resource "aws_instance" "basic_instance" {
    # AMI Id
    ami = "ami-008b082bb4488df2b"

    # what instance type?
    instance_type = "t3.micro"

    # add an auto-assigned public Id
    associate_public_ip_address = true

    # name instance on aws
    tags = {
    Name = "se-steph-terraform-basic-instance"
    }
}
