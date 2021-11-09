resource "aws_ecr_repository" "repo" {
  for_each             = toset(var.repo_name)
  name                 = each.value
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
