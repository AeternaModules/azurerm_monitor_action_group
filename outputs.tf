output "monitor_action_groups_id" {
  description = "Map of id values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.id if v.id != null && length(v.id) > 0 }
}
output "monitor_action_groups_arm_role_receiver" {
  description = "Map of arm_role_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.arm_role_receiver if v.arm_role_receiver != null && length(v.arm_role_receiver) > 0 }
}
output "monitor_action_groups_automation_runbook_receiver" {
  description = "Map of automation_runbook_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.automation_runbook_receiver if v.automation_runbook_receiver != null && length(v.automation_runbook_receiver) > 0 }
}
output "monitor_action_groups_azure_app_push_receiver" {
  description = "Map of azure_app_push_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.azure_app_push_receiver if v.azure_app_push_receiver != null && length(v.azure_app_push_receiver) > 0 }
}
output "monitor_action_groups_azure_function_receiver" {
  description = "Map of azure_function_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.azure_function_receiver if v.azure_function_receiver != null && length(v.azure_function_receiver) > 0 }
}
output "monitor_action_groups_email_receiver" {
  description = "Map of email_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.email_receiver if v.email_receiver != null && length(v.email_receiver) > 0 }
}
output "monitor_action_groups_enabled" {
  description = "Map of enabled values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.enabled if v.enabled != null }
}
output "monitor_action_groups_event_hub_receiver" {
  description = "Map of event_hub_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.event_hub_receiver if v.event_hub_receiver != null && length(v.event_hub_receiver) > 0 }
}
output "monitor_action_groups_itsm_receiver" {
  description = "Map of itsm_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.itsm_receiver if v.itsm_receiver != null && length(v.itsm_receiver) > 0 }
}
output "monitor_action_groups_location" {
  description = "Map of location values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.location if v.location != null && length(v.location) > 0 }
}
output "monitor_action_groups_logic_app_receiver" {
  description = "Map of logic_app_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.logic_app_receiver if v.logic_app_receiver != null && length(v.logic_app_receiver) > 0 }
}
output "monitor_action_groups_name" {
  description = "Map of name values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.name if v.name != null && length(v.name) > 0 }
}
output "monitor_action_groups_resource_group_name" {
  description = "Map of resource_group_name values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "monitor_action_groups_short_name" {
  description = "Map of short_name values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.short_name if v.short_name != null && length(v.short_name) > 0 }
}
output "monitor_action_groups_sms_receiver" {
  description = "Map of sms_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.sms_receiver if v.sms_receiver != null && length(v.sms_receiver) > 0 }
}
output "monitor_action_groups_tags" {
  description = "Map of tags values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "monitor_action_groups_voice_receiver" {
  description = "Map of voice_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.voice_receiver if v.voice_receiver != null && length(v.voice_receiver) > 0 }
}
output "monitor_action_groups_webhook_receiver" {
  description = "Map of webhook_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.webhook_receiver if v.webhook_receiver != null && length(v.webhook_receiver) > 0 }
}

