- removes the need for clicking, naming things, reading guides - more clickOps
- not time efficient
- human error
- not idempotent/not standardised
- complex pipelines not ideal for further automation
- poor collaboration - doesn't align with devOps culture
- poor version control (unless using launch templates) eg. if changing vpc slightly, must write a new guide

# IaC

- infrastructure as code
  eg. Terraform
- instead of using manual processes to set up infrastructure, use code instead
- write a script to build the infrastructure for us, and run on AWS
- codifying the creation, provisioning and configuration of infrastructure

# orchestration vs config management

- config management is the management of what is inside the framework eg. the software
- orchestration is building the entire framework and setting up the utilities - the infrastructure itself

# terraform

- tools like terraform can be used during the orchestration process
- sets up the dev dependencies, making sure everything is run in the correct order
- not able to perform config management
- speed, simplicity, easy to deploy, consistency and accuracy, improves scalability, allows for version control
- cloud agnostic
- provisioning tool
- automates infrastructure deployment
- modular
- stepwise - shows you what went wrong
- easy to use
- open source

- must link terraform to aws via AWS CLI using aws credentials
- aws credentials are highly sensitive, so must be kept confidential unless you want to incur fines
  - ~/aws/credentials
  - ~/aws/config

**Downloading aws cli and configuring aws credentials:**
`sudo apt install awscli` - this command many not work, when downloading on Ubuntu, so try the command: `snap install aws-cli --classic`

- to check it has been installed, run the command `aws --version`
- awscli must now be configured using `aws configure`
- follow the instructions on the cli by entering:

  - aws access key id
  - aws secret access key
  - default region name: eu-west-1
  - default output format: json

- run the command `aws sts get-caller-identity` to check the configuration has been set up properly

# using terraform to create an EC2 instance on AWS

- create a new folder to contain all terraform files
- name the main terraform file main.tf
- terraform must know what cloud provider to use

```
provider "aws" {
  region = "eu-west-1"
}
```

- the file must then be initialised by running the command `terraform init`
- this will install all the dependencies/plugins required

```
resource "aws_instance" "basic_instance" {
    # AMI ID
    ami = "ami-008b082bb4488df2b"

    # what instance type?
    instance_type = "t3.micro"

    # add an auto-assigned public ip
    associate_public_ip_address = true

    # name instance on aws
    tags = {
    Name = "se-steph-terraform-basic-instance"
    }
}
```

- the instance created must be referenced by terraform, especially if the script contains more than one instance, so each instance must be named
- the ami ID and instance type lets terraform know what launch template to use and which instance type without having to do so on the aws site
- can give the instance a public ip address to access
- without key pair login, unable to login to the instance via SSH
- all ports are closed as no security groups have been created
- the instance created is very basic

- once the script has been written, run the command `terraform plan`
  - this command will show if main.tf has been correctly formatted - changes made to existing files can be catastrophic
- terraform is destructive (can create, modify or destroy)
- once satisfied with the script, run `terraform apply`
- once completed, terraform will even supply the instance id, which can be used to check if it has been corrected on the aws website
- to terminate the instance, run `terraform destroy`

terraform.tfstate files are very sensitive, **Keep Confidential**

- must add them to .gitignore files if tracking with git
- add .terraform folder and terraform.lock.hcl file to .gitignore
