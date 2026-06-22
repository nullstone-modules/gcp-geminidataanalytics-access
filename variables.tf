variable "app_metadata" {
  description = <<EOF
Nullstone automatically injects metadata from the app module into this module through this variable.
This variable is a reserved variable for capabilities.
EOF

  type    = map(string)
  default = {}
}

locals {
  service_account_email = var.app_metadata["service_account_email"]
}

variable "access" {
  description = <<EOF
A list of Gemini Data Analytics roles to grant to the app's service account at the project level.
Each item is interpolated as `roles/geminidataanalytics.<item>`, so provide only the suffix of the
predefined role (e.g. `dataAgentUser`, `dataAgentViewer`).

Valid values:
  - admin
  - viewer
  - dataAgentCreator
  - dataAgentEditor
  - dataAgentOwner
  - dataAgentUser
  - dataAgentViewer
  - dataAgentStatelessUser
  - queryDataUser
EOF

  type = list(string)

  validation {
    condition = alltrue([
      for item in var.access : contains([
        "admin",
        "viewer",
        "dataAgentCreator",
        "dataAgentEditor",
        "dataAgentOwner",
        "dataAgentUser",
        "dataAgentViewer",
        "dataAgentStatelessUser",
        "queryDataUser",
      ], item)
    ])
    error_message = "Each item in access must be a valid Gemini Data Analytics role suffix (interpolated as roles/geminidataanalytics.<item>). Valid values: admin, viewer, dataAgentCreator, dataAgentEditor, dataAgentOwner, dataAgentUser, dataAgentViewer, dataAgentStatelessUser, queryDataUser."
  }
}
