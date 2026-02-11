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
    enabled             = optional(bool)   # Default: true
    location            = optional(string) # Default: "global"
    tags                = optional(map(string))
    arm_role_receiver = optional(object({
      name                    = string
      role_id                 = string
      use_common_alert_schema = optional(bool)
    }))
    automation_runbook_receiver = optional(object({
      automation_account_id   = string
      is_global_runbook       = bool
      name                    = string
      runbook_name            = string
      service_uri             = string
      use_common_alert_schema = optional(bool) # Default: false
      webhook_resource_id     = string
    }))
    azure_app_push_receiver = optional(object({
      email_address = string
      name          = string
    }))
    azure_function_receiver = optional(object({
      function_app_resource_id = string
      function_name            = string
      http_trigger_url         = string
      name                     = string
      use_common_alert_schema  = optional(bool)
    }))
    email_receiver = optional(object({
      email_address           = string
      name                    = string
      use_common_alert_schema = optional(bool)
    }))
    event_hub_receiver = optional(object({
      event_hub_name          = string
      event_hub_namespace     = string
      name                    = string
      subscription_id         = optional(string)
      tenant_id               = optional(string)
      use_common_alert_schema = optional(bool)
    }))
    itsm_receiver = optional(object({
      connection_id        = string
      name                 = string
      region               = string
      ticket_configuration = string
      workspace_id         = string
    }))
    logic_app_receiver = optional(object({
      callback_url            = string
      name                    = string
      resource_id             = string
      use_common_alert_schema = optional(bool)
    }))
    sms_receiver = optional(object({
      country_code = string
      name         = string
      phone_number = string
    }))
    voice_receiver = optional(object({
      country_code = string
      name         = string
      phone_number = string
    }))
    webhook_receiver = optional(object({
      aad_auth = optional(object({
        identifier_uri = optional(string)
        object_id      = string
        tenant_id      = optional(string)
      }))
      name                    = string
      service_uri             = string
      use_common_alert_schema = optional(bool)
    }))
  }))
}

