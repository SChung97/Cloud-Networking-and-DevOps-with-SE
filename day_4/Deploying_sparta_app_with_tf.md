# steps to deploy the sparta app using terraform

- create a new terraform folder and a main.tf file
- declare what provider you want terraform to create the app instance on
  ```
  provider "aws" {
    region = "eu-west-1"
  }
  ```
- initialise the project by running `terraform init` (text within bash terminal will be green)

- add resources to the main.tf file to let terraform how to create the app instance.
- all resources are hardcoded below, check the main.tf file of terraform\deploying_sparta_app to see the dynamic code using variables

```
resource "aws_instance" "app_instance" {
  ami = "ami-0246312b3fe1e4ce6"

  instance_type = "t3.micro"

  associate_public_ip_address = true

  key_name = "tech518-steph-key-pair"

  vpc_security_group_ids = ["sg-08821ae47c7f4e0db"]

  user_data = file("${path.module}/deploy_app.sh)

  tags = {
    Name = "tech518-steph-terraform-app-instance"
  }
}
```

- the key name allows for logging into the instance via SSH, but the security group must have port 22 open, this allows for troubleshooting the instance
- the user data script should allow for the app to automatically be deployed without having to log in via SSH and manually running the commands
- the instance is named within the tags section

- run `terraform plan` to preview how terraform plans to execute the creation of the instance
- provided there are no issues, run `terraform apply`, and enter `yes`, to begin the execution of the EC2 instance
- the creation of the app instance can be confirmed on the AWS EC2 console
  

- to terminate the instance, run the command `terraform destroy` and enter `yes`