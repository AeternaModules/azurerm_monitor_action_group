output "monitor_action_groups" {
  description = "All monitor_action_group resources"
  value       = azurerm_monitor_action_group.monitor_action_groups
}
output "monitor_action_groups_arm_role_receiver" {
  description = "List of arm_role_receiver values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.arm_role_receiver]
}
output "monitor_action_groups_automation_runbook_receiver" {
  description = "List of automation_runbook_receiver values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.automation_runbook_receiver]
}
output "monitor_action_groups_azure_app_push_receiver" {
  description = "List of azure_app_push_receiver values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.azure_app_push_receiver]
}
output "monitor_action_groups_azure_function_receiver" {
  description = "List of azure_function_receiver values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.azure_function_receiver]
}
output "monitor_action_groups_email_receiver" {
  description = "List of email_receiver values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.email_receiver]
}
output "monitor_action_groups_enabled" {
  description = "List of enabled values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.enabled]
}
output "monitor_action_groups_event_hub_receiver" {
  description = "List of event_hub_receiver values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.event_hub_receiver]
}
output "monitor_action_groups_itsm_receiver" {
  description = "List of itsm_receiver values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.itsm_receiver]
}
output "monitor_action_groups_location" {
  description = "List of location values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.location]
}
output "monitor_action_groups_logic_app_receiver" {
  description = "List of logic_app_receiver values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.logic_app_receiver]
}
output "monitor_action_groups_name" {
  description = "List of name values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.name]
}
output "monitor_action_groups_resource_group_name" {
  description = "List of resource_group_name values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.resource_group_name]
}
output "monitor_action_groups_short_name" {
  description = "List of short_name values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.short_name]
}
output "monitor_action_groups_sms_receiver" {
  description = "List of sms_receiver values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.sms_receiver]
}
output "monitor_action_groups_tags" {
  description = "List of tags values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.tags]
}
output "monitor_action_groups_voice_receiver" {
  description = "List of voice_receiver values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.voice_receiver]
}
output "monitor_action_groups_webhook_receiver" {
  description = "List of webhook_receiver values across all monitor_action_groups"
  value       = [for k, v in azurerm_monitor_action_group.monitor_action_groups : v.webhook_receiver]
}

