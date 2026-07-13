variable "monitor_action_groups" {
  description = <<EOT
Map of monitor_action_groups, attributes below
Required:
    - name
    - resource_group_name
    - short_name
Optional:
    - enabled
    - location
    - tags
    - arm_role_receiver (block):
        - name (required)
        - role_id (required)
        - use_common_alert_schema (optional)
    - automation_runbook_receiver (block):
        - automation_account_id (required)
        - is_global_runbook (required)
        - name (required)
        - runbook_name (required)
        - service_uri (required)
        - use_common_alert_schema (optional)
        - webhook_resource_id (required)
    - azure_app_push_receiver (block):
        - email_address (required)
        - name (required)
    - azure_function_receiver (block):
        - function_app_resource_id (required)
        - function_name (required)
        - http_trigger_url (required)
        - name (required)
        - use_common_alert_schema (optional)
    - email_receiver (block):
        - email_address (required)
        - name (required)
        - use_common_alert_schema (optional)
    - event_hub_receiver (block):
        - event_hub_name (required)
        - event_hub_namespace (required)
        - name (required)
        - subscription_id (optional)
        - tenant_id (optional)
        - use_common_alert_schema (optional)
    - itsm_receiver (block):
        - connection_id (required)
        - name (required)
        - region (required)
        - ticket_configuration (required)
        - workspace_id (required)
    - logic_app_receiver (block):
        - callback_url (required)
        - name (required)
        - resource_id (required)
        - use_common_alert_schema (optional)
    - sms_receiver (block):
        - country_code (required)
        - name (required)
        - phone_number (required)
    - voice_receiver (block):
        - country_code (required)
        - name (required)
        - phone_number (required)
    - webhook_receiver (block):
        - aad_auth (optional, block):
            - identifier_uri (optional)
            - object_id (required)
            - tenant_id (optional)
        - name (required)
        - service_uri (required)
        - use_common_alert_schema (optional)
EOT

  type = map(object({
    name                = string
    resource_group_name = string
    short_name          = string
    enabled             = optional(bool)
    location            = optional(string)
    tags                = optional(map(string))
    arm_role_receiver = optional(list(object({
      name                    = string
      role_id                 = string
      use_common_alert_schema = optional(bool)
    })))
    automation_runbook_receiver = optional(list(object({
      automation_account_id   = string
      is_global_runbook       = bool
      name                    = string
      runbook_name            = string
      service_uri             = string
      use_common_alert_schema = optional(bool)
      webhook_resource_id     = string
    })))
    azure_app_push_receiver = optional(list(object({
      email_address = string
      name          = string
    })))
    azure_function_receiver = optional(list(object({
      function_app_resource_id = string
      function_name            = string
      http_trigger_url         = string
      name                     = string
      use_common_alert_schema  = optional(bool)
    })))
    email_receiver = optional(list(object({
      email_address           = string
      name                    = string
      use_common_alert_schema = optional(bool)
    })))
    event_hub_receiver = optional(list(object({
      event_hub_name          = string
      event_hub_namespace     = string
      name                    = string
      subscription_id         = optional(string)
      tenant_id               = optional(string)
      use_common_alert_schema = optional(bool)
    })))
    itsm_receiver = optional(list(object({
      connection_id        = string
      name                 = string
      region               = string
      ticket_configuration = string
      workspace_id         = string
    })))
    logic_app_receiver = optional(list(object({
      callback_url            = string
      name                    = string
      resource_id             = string
      use_common_alert_schema = optional(bool)
    })))
    sms_receiver = optional(list(object({
      country_code = string
      name         = string
      phone_number = string
    })))
    voice_receiver = optional(list(object({
      country_code = string
      name         = string
      phone_number = string
    })))
    webhook_receiver = optional(list(object({
      aad_auth = optional(object({
        identifier_uri = optional(string)
        object_id      = string
        tenant_id      = optional(string)
      }))
      name                    = string
      service_uri             = string
      use_common_alert_schema = optional(bool)
    })))
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_monitor_action_group's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: short_name
  #   condition: length(value) >= 1 && length(value) <= 12
  #   message:   must be between 1 and 12 characters
  # path: email_receiver.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: email_receiver.email_address
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: itsm_receiver.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: itsm_receiver.workspace_id
  #   source:    [from validate.WorkspaceID] !ok
  # path: itsm_receiver.workspace_id
  #   condition: length(value) != 2
  #   message:   [from validate.WorkspaceID: invalid when len(value) == 2]
  #   source:    [from validate.WorkspaceID: invalid when len(value) == 2]
  # path: itsm_receiver.workspace_id
  #   source:    [from validate.WorkspaceID] err != nil
  # path: itsm_receiver.workspace_id
  #   source:    [from validate.WorkspaceID] err != nil
  # path: itsm_receiver.connection_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: itsm_receiver.ticket_configuration
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
  # path: itsm_receiver.region
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: azure_app_push_receiver.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: azure_app_push_receiver.email_address
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sms_receiver.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sms_receiver.country_code
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sms_receiver.phone_number
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: webhook_receiver.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: webhook_receiver.service_uri
  #   source:    validation.IsURLWithScheme(...) - no translation rule yet, add one
  # path: webhook_receiver.aad_auth.object_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: webhook_receiver.aad_auth.identifier_uri
  #   source:    validation.IsURLWithScheme(...) - no translation rule yet, add one
  # path: webhook_receiver.aad_auth.tenant_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: automation_runbook_receiver.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: automation_runbook_receiver.automation_account_id
  #   source:    [from automationaccount.ValidateAutomationAccountID] !ok
  # path: automation_runbook_receiver.automation_account_id
  #   source:    [from automationaccount.ValidateAutomationAccountID] err != nil
  # path: automation_runbook_receiver.runbook_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: automation_runbook_receiver.webhook_resource_id
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: automation_runbook_receiver.service_uri
  #   source:    validation.IsURLWithScheme(...) - no translation rule yet, add one
  # path: voice_receiver.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: voice_receiver.country_code
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: voice_receiver.phone_number
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: logic_app_receiver.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: logic_app_receiver.resource_id
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: logic_app_receiver.callback_url
  #   source:    validation.IsURLWithScheme(...) - no translation rule yet, add one
  # path: azure_function_receiver.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: azure_function_receiver.function_app_resource_id
  #   source:    [from commonids.ValidateFunctionAppID] !ok
  # path: azure_function_receiver.function_app_resource_id
  #   source:    [from commonids.ValidateFunctionAppID] err != nil
  # path: azure_function_receiver.function_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: azure_function_receiver.http_trigger_url
  #   source:    validation.IsURLWithScheme(...) - no translation rule yet, add one
  # path: arm_role_receiver.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: arm_role_receiver.role_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: event_hub_receiver.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: event_hub_receiver.event_hub_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: event_hub_receiver.event_hub_namespace
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: event_hub_receiver.tenant_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: event_hub_receiver.subscription_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

