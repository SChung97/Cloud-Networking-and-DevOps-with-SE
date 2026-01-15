provider "github" {
    token = var.token
    owner = var.owner
}

resource "github_repository" "test_github_repo" {
  name = "Creating_repo_with_tf"

  description = "This is a new repo created using terraform"

  visibility = "private"

  auto_init = true
}