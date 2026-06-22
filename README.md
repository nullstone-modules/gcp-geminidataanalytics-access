# gcp-geminidataanalytics-access

Grants a GCP app's service account access to [Gemini Data Analytics](https://cloud.google.com/gemini/docs/conversational-analytics-api/overview)
(the Conversational Analytics API).

This is a Nullstone capability module. When attached to an app, it reads the app's service account from
`app_metadata` and binds the requested predefined `roles/geminidataanalytics.*` roles to it at the project level.

## Usage

Configure the `access` variable with the role suffixes you want to grant. Each item is interpolated as
`roles/geminidataanalytics.<item>`.

```hcl
access = ["dataAgentUser", "dataAgentViewer"]
```

## Roles

| `access` value           | Role                                               | Description                                                   |
|--------------------------|----------------------------------------------------|---------------------------------------------------------------|
| `admin`                  | `roles/geminidataanalytics.admin`                  | Full administrative access to Gemini Data Analytics.          |
| `viewer`                 | `roles/geminidataanalytics.viewer`                 | Read-only access to Gemini Data Analytics.                    |
| `dataAgentCreator`       | `roles/geminidataanalytics.dataAgentCreator`       | Permission to create data agents in a project.                |
| `dataAgentEditor`        | `roles/geminidataanalytics.dataAgentEditor`        | Permission to edit data agents in a project.                  |
| `dataAgentOwner`         | `roles/geminidataanalytics.dataAgentOwner`         | Permission to edit, share, or delete a data agent.            |
| `dataAgentUser`          | `roles/geminidataanalytics.dataAgentUser`          | Permission to chat with a data agent.                         |
| `dataAgentViewer`        | `roles/geminidataanalytics.dataAgentViewer`        | Permission to view a data agent.                              |
| `dataAgentStatelessUser` | `roles/geminidataanalytics.dataAgentStatelessUser` | Permission for stateless chat interactions.                   |
| `queryDataUser`          | `roles/geminidataanalytics.queryDataUser`          | Permission to query data from supported sources (QueryData).  |

See the [Gemini Data Analytics IAM roles reference](https://cloud.google.com/iam/docs/roles-permissions/geminidataanalytics)
for the full set of permissions associated with each role.

## Inputs

| Name           | Description                                                                                                    | Type           | Default | Required |
|----------------|----------------------------------------------------------------------------------------------------------------|----------------|---------|----------|
| `access`       | A list of Gemini Data Analytics role suffixes to grant at the project level.                                   | `list(string)` | n/a     | yes      |
| `app_metadata` | Reserved capability variable. Nullstone injects app metadata (including the service account) into this module. | `map(string)`  | `{}`    | no       |

## Outputs

None.
