provider "github" {
  token = var.token
}

resource "github_repository" "create_repo" {
  name        = "terraform-practice"
  description = "Automated repo created using Terraform"
  visibility = "public"
}

output "url" {
  value = github_repository.create_repo.http_clone_url
}