resource "google_secure_source_manager_repository_iam_binding" "secure_source_manager_repository_iam_bindings" {
  for_each = var.secure_source_manager_repository_iam_bindings

  members       = each.value.members
  repository_id = each.value.repository_id
  role          = each.value.role
  location      = each.value.location
  project       = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

