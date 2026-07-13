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
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        length(v.short_name) >= 1 && length(v.short_name) <= 12
      )
    ])
    error_message = "must be between 1 and 12 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.email_receiver == null || alltrue([for item in v.email_receiver : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.email_receiver == null || alltrue([for item in v.email_receiver : (length(item.email_address) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.itsm_receiver == null || alltrue([for item in v.itsm_receiver : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.itsm_receiver == null || alltrue([for item in v.itsm_receiver : (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.connection_id)))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.itsm_receiver == null || alltrue([for item in v.itsm_receiver : (can(jsondecode(item.ticket_configuration)))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.itsm_receiver == null || alltrue([for item in v.itsm_receiver : (length(item.region) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.azure_app_push_receiver == null || alltrue([for item in v.azure_app_push_receiver : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.azure_app_push_receiver == null || alltrue([for item in v.azure_app_push_receiver : (length(item.email_address) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.sms_receiver == null || alltrue([for item in v.sms_receiver : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.sms_receiver == null || alltrue([for item in v.sms_receiver : (length(item.country_code) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.sms_receiver == null || alltrue([for item in v.sms_receiver : (length(item.phone_number) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.webhook_receiver == null || alltrue([for item in v.webhook_receiver : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.webhook_receiver == null || alltrue([for item in v.webhook_receiver : (item.aad_auth == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.aad_auth.object_id))))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.webhook_receiver == null || alltrue([for item in v.webhook_receiver : (item.aad_auth == null || (item.aad_auth.tenant_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.aad_auth.tenant_id)))))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.automation_runbook_receiver == null || alltrue([for item in v.automation_runbook_receiver : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.automation_runbook_receiver == null || alltrue([for item in v.automation_runbook_receiver : (length(item.runbook_name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.automation_runbook_receiver == null || alltrue([for item in v.automation_runbook_receiver : (length(item.webhook_resource_id) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.voice_receiver == null || alltrue([for item in v.voice_receiver : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.voice_receiver == null || alltrue([for item in v.voice_receiver : (length(item.country_code) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.voice_receiver == null || alltrue([for item in v.voice_receiver : (length(item.phone_number) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.logic_app_receiver == null || alltrue([for item in v.logic_app_receiver : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.logic_app_receiver == null || alltrue([for item in v.logic_app_receiver : (length(item.resource_id) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.azure_function_receiver == null || alltrue([for item in v.azure_function_receiver : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.azure_function_receiver == null || alltrue([for item in v.azure_function_receiver : (length(item.function_name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.arm_role_receiver == null || alltrue([for item in v.arm_role_receiver : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.arm_role_receiver == null || alltrue([for item in v.arm_role_receiver : (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.role_id)))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.event_hub_receiver == null || alltrue([for item in v.event_hub_receiver : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.event_hub_receiver == null || alltrue([for item in v.event_hub_receiver : (length(item.event_hub_name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.event_hub_receiver == null || alltrue([for item in v.event_hub_receiver : (length(item.event_hub_namespace) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.event_hub_receiver == null || alltrue([for item in v.event_hub_receiver : (item.tenant_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.tenant_id))))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.event_hub_receiver == null || alltrue([for item in v.event_hub_receiver : (item.subscription_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.subscription_id))))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_action_groups : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 18 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

