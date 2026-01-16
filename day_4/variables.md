# Variables

- instead of hard coding, can be made dynamic using variables
- create a new variables.tf file within the same initialised project
- all variables.tf files should be added to .gitignore file, as it can contain sensitive information

```
variable "instance_type" {
    type = string
    description = "EC2 instance type"
    default = "t3.micro"
}

```

- variables can then be accessed in main.tf using dot notation eg. `var.instance_type`

# tf vars

- create another file
- tfvars mainly used during production - values used when developing the app/db so won't have to change all values
- in order to run tf vars file, run the command `terraform apply -var-file='tfvars-filename'`