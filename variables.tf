variable "secure_source_manager_repository_iam_bindings" {
  description = <<EOT
Map of secure_source_manager_repository_iam_bindings, attributes below
Required:
    - members
    - repository_id
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    members       = set(string)
    repository_id = string
    role          = string
    location      = optional(string)
    project       = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

