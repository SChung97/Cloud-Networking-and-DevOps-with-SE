# Using terraform to create a github repository

- use a variables.tf file to hold all sensitive info:
  - your github pat token

**Typical variable.tf layout:**
```
variable "token" {
    type = string
    description = "your PAT token"
    default = "your PAT token for github here..."
}

- create a terraform folder to hold the project
- add the provider in a main.tf file and initialise terraform using `terraform init`

```
provider "github" {
    token = var.your_pat_token
    owner = var.your_username
}
```

- declare what you want to be created by terraform, in this case we want to create a new github repo

```
resource "github_repository" "test_github_repo" {
  name = "Creating_repo_with_tf"

  description = "This is a new repo created using terraform"

  visibility = "private"

  auto_init = true
}
```