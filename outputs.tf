output "monitor_action_groups_arm_role_receiver" {
  description = "Map of arm_role_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.arm_role_receiver }
}
output "monitor_action_groups_automation_runbook_receiver" {
  description = "Map of automation_runbook_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.automation_runbook_receiver }
}
output "monitor_action_groups_azure_app_push_receiver" {
  description = "Map of azure_app_push_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.azure_app_push_receiver }
}
output "monitor_action_groups_azure_function_receiver" {
  description = "Map of azure_function_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.azure_function_receiver }
}
output "monitor_action_groups_email_receiver" {
  description = "Map of email_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.email_receiver }
}
output "monitor_action_groups_enabled" {
  description = "Map of enabled values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.enabled }
}
output "monitor_action_groups_event_hub_receiver" {
  description = "Map of event_hub_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.event_hub_receiver }
}
output "monitor_action_groups_itsm_receiver" {
  description = "Map of itsm_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.itsm_receiver }
}
output "monitor_action_groups_location" {
  description = "Map of location values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.location }
}
output "monitor_action_groups_logic_app_receiver" {
  description = "Map of logic_app_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.logic_app_receiver }
}
output "monitor_action_groups_name" {
  description = "Map of name values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.name }
}
output "monitor_action_groups_resource_group_name" {
  description = "Map of resource_group_name values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.resource_group_name }
}
output "monitor_action_groups_short_name" {
  description = "Map of short_name values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.short_name }
}
output "monitor_action_groups_sms_receiver" {
  description = "Map of sms_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.sms_receiver }
}
output "monitor_action_groups_tags" {
  description = "Map of tags values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.tags }
}
output "monitor_action_groups_voice_receiver" {
  description = "Map of voice_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.voice_receiver }
}
output "monitor_action_groups_webhook_receiver" {
  description = "Map of webhook_receiver values across all monitor_action_groups, keyed the same as var.monitor_action_groups"
  value       = { for k, v in azurerm_monitor_action_group.monitor_action_groups : k => v.webhook_receiver }
}

